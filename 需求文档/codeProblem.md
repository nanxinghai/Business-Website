## 项目开发所涉及技术点总结

对项目开发所涉及的知识点及技术点总结，方便后面复盘。也可以在别的项目中使用，亦或是对项目的一些记录。

如何将自己的项目发布到maven仓库：https://www.cnblogs.com/bolingcavalry/p/15820840.html

#### 1、项目中统一返回数据格式+统一异常

参考：https://blog.csdn.net/qq_38238956/article/details/125043187

在前后端分离系统中，为保证前后端通信的规范，于是通常会把后端的信息封装成如下所示

```json
{
	code:0,
	msg:"success",
	data:数据
}
```

[![zgRjMt.png](https://s1.ax1x.com/2022/12/07/zgRjMt.png)](https://imgse.com/i/zgRjMt)



为了完成这样的效果，我们通常会封装一个类，例如：

```java
@Data
public class Result implements Serializable {
    private Integer code;
    private String msg;
    private Object data;
    private Result(){}
    public static Result success(Object data){
        Result result = new Result();
        result.setCode(ResultCode.SUCCESS.code());
        result.setMsg(ResultCode.SUCCESS.msg());
        result.setData(data);
        return result;
    }
    public static Result failure(String message){
        Result result = new Result();
        result.setCode(ResultCode.FAILURE.code());
        result.setMsg(message);
        result.setData(null);
        return result;
    }
}
```

还会写一个枚举类作为code和msg

```java
public enum ResultCode {
    SUCCESS(0,"成功"),
    FAILURE(-1,"失败");

    private Integer code;
    private String msg;

    ResultCode(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }
    public Integer code(){
        return this.code;
    }
    public String msg(){
        return this.msg;
    }
}
```

写到这里，其实已经可以完成功能，但是如果每个响应都去调用一次Result.success(data)方法是非常愚蠢的。

我们可以利用springboot的全局响应拦截，怎么做呢，

创建一个类，打上注解@ControllerAdvice，再实现ResponseBodyAdvice<Object>接口

必须在里面重写两个方法，一个boolean supports()方法，一个Object beforeBodyWrite()方法

beforeBodyWrite就可以重写响应结果，而supports方法返回的boolean值决定是否执行beforeBodyWrite方法

**如果一味的将supports方法返回true，那么说明每一个响应都会返回统一的格式，但如果我有一个请求想返回一个文件流呢**

基于以上想法，暂且想到的解决思路：

> 自定义一个注解，将注解打在请求的方法上，创建一个全局拦截器，拦截请求，如果请求的方法上发现有我们自定义的注解，那么我们在request请求域中添加一个属性（标识）,然后再全局响应拦截中的supports()方法中，判断请求域中是否有之前添加的标识，如果有，则返回true，没有就返回false。返回true就表示执行beforeBodyWrite（）方法，就可以重写响应结果

实战：

1、创建一个自定义注解：

```java
@Target(ElementType.METHOD) // 该注解可以使用在方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ResultApi {
}
```

2、创建一个拦截器

```java
@Component
public class ResultInterceptor implements HandlerInterceptor {
    // 标记
    public static final String RESPONSE_RESULT = "response_flag";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if(handler instanceof HandlerMethod){
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            // 获取方法名
            Method method = handlerMethod.getMethod();
            // 如果方法被ResultApi注解修饰
            if(method.isAnnotationPresent(ResultApi.class)){
                request.setAttribute(RESPONSE_RESULT,method.getAnnotation(ResultApi.class));
            }
        }
        return true;
    }
}
```

3、使拦截器生效，并拦截所有路径

```java
@Configuration
public class MyWebConfig implements WebMvcConfigurer {
    /**
     * 拦截全部
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new ResultInterceptor()).addPathPatterns("/**");
    }
}
```

4、创建全局响应拦截

```java
@Slf4j
@ControllerAdvice
public class ResponseAdivce implements ResponseBodyAdvice<Object> {
    /**
     * 返回true，才能执行beforeBodyWrite方法
     * @param returnType
     * @param converterType
     * @return
     */
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = sra.getRequest();
        ResultApi resultApi = (ResultApi) request.getAttribute(ResultInterceptor.RESPONSE_RESULT);
        return resultApi != null;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        if(body instanceof Result){
            // 如果body已经属于Result类，针对异常情况
            return body;
        }
        return Result.success(body);
    }

}
```

此时，只要你在请求的方法上打上注解，便能自动统一封装。只要不打注解，这个请求就不会封装（比如要返回文件流的请求）

[![zRFw01.png](https://s1.ax1x.com/2022/12/08/zRFw01.png)](https://imgse.com/i/zRFw01)

但是此时如果在方法中遇到异常了，它还会封装吗？显然是不会的，所以我们还要创建全局异常拦截。springboot提供在@ControllerAdvice注解的类中，建立一个方法，方法上打上注解@ExceptionHandler(Exception.class) 括号里面是异常的字节码

括号里面是什么异常，他便会拦截什么异常，于是我们自定义一个异常

```java
public class MyException extends RuntimeException {

    private String message;

    public MyException(String message){
        super(message);
        this.message = message;
    }
}
```

再完善上面的类

```java
/**
 * @author ：Simon
 * @date ：Created in 2022/12/5 23:39
 * @description：响应之前拦截
 * @modified By：
 * @version: v1.0
 */
@Slf4j
@ControllerAdvice
public class ResponseAdivce implements ResponseBodyAdvice<Object> {
    /**
     * 返回true，才能执行beforeBodyWrite方法
     * @param returnType
     * @param converterType
     * @return
     */
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = sra.getRequest();
        ResultApi resultApi = (ResultApi) request.getAttribute(ResultInterceptor.RESPONSE_RESULT);
        return resultApi != null;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        if(body instanceof Result){
            // 如果body已经属于Result类，针对异常情况
            return body;
        }
        return Result.success(body);
    }

    /**
     * 使用ExceptionHandler注解声明处理Exception异常
     *
     * @param e e
     * @return {@link Result}
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Result exception(Exception e) {
        // 控制台打印异常
        e.printStackTrace();
        log.error(e.toString());
        // 返回错误格式信息
        return Result.failure(e.toString());
    }

    /**
     * 使用ExceptionHandler注解声明处理Exception异常
     *
     * @param e e
     * @return {@link Result}
     */
    @ResponseBody
    @ExceptionHandler(MyException.class)
    public Result exception(MyException e) {
        // 控制台打印异常
        e.printStackTrace();
        log.error(e.toString());
        // 返回错误格式信息
        return Result.failure(e.toString());
    }

}
```

再次完善这个异常拦截，将堆栈信息输出到日志中

```java
/**
     * 使用ExceptionHandler注解声明处理Exception异常
     *
     * @param e e
     * @return {@link Result}
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Result exception(HttpServletRequest req, Exception e) {
        // 控制台打印异常
        e.printStackTrace();
        log(req, e);
        // 返回错误格式信息
        return Result.failure(e.getMessage());
    }

    /**
     * 使用ExceptionHandler注解声明处理Exception异常
     *
     * @param e e
     * @return {@link Result}
     */
    @ResponseBody
    @ExceptionHandler(MyException.class)
    public Result exception(HttpServletRequest req, MyException e) {
        // 控制台打印异常
        e.printStackTrace();
        log(req, e);
        // 返回错误格式信息
        return Result.failure(e.getMessage());
    }

    // 打印堆栈信息日志
    public void log(HttpServletRequest request, Exception exception){
        //换行符
        String lineSeparatorStr = System.getProperty("line.separator");
        StringBuilder exStr = new StringBuilder();
        StackTraceElement[] trace = exception.getStackTrace();
        // 获取堆栈信息并输出为打印的形式
        for (StackTraceElement s : trace) {
            exStr.append("\tat " + s + "\r\n");
        }
        //打印error级别的堆栈日志
        //打印error级别的堆栈日志
        log.error("访问地址：" + request.getRequestURL() + ",请求方法：" + request.getMethod() +
                ",远程地址：" + request.getRemoteAddr() + lineSeparatorStr +
                "错误堆栈信息如下:" + exception.toString() + lineSeparatorStr + exStr);
    }
```



#### 2、springboot项目的日志

在resource目录下创建logback-spring.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>

<configuration scan="true" scanPeriod="10 seconds">
        <!-- 日志级别从低到高分为TRACE < DEBUG < INFO < WARN < ERROR < FATAL，如果设置为WARN，则低于WARN的信息都不会输出 -->
        <!-- scan:当此属性设置为true时，配置文件如果发生改变，将会被重新加载，默认值为true -->
        <!-- scanPeriod:设置监测配置文件是否有修改的时间间隔，如果没有给出时间单位，默认单位是毫秒。当scan为true时，此属性生效。默认的时间间隔为1分钟。 -->
        <!-- debug:当此属性设置为true时，将打印出logback内部日志信息，实时查看logback运行状态。默认值为false。 -->
        <contextName>logback</contextName>
        <!-- name的值是变量的名称，value的值时变量定义的值。通过定义的值会被插入到logger上下文中。定义变量后，可以使“${}”来使用变量。 -->
        <property name="log.path" value="./log" />
        <!-- 彩色日志 -->
        <!-- 配置格式变量：CONSOLE_LOG_PATTERN 彩色日志格式 -->
        <!-- magenta:洋红 -->
        <!-- boldMagenta:粗红-->
        <!-- cyan:青色 -->
        <!-- white:白色 -->
        <!-- magenta:洋红 -->
        <property name="CONSOLE_LOG_PATTERN"
                  value="%yellow(%date{yyyy-MM-dd HH:mm:ss}) |%highlight(%-5level) |%blue(%thread) |%blue(%file:%line) |%green(%logger) |%cyan(%msg%n)"/>
        <!--输出到控制台-->
        <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
            <!--此日志appender是为开发使用，只配置最底级别，控制台输出的日志级别是大于或等于此级别的日志信息-->
            <!-- 例如：如果此处配置了INFO级别，则后面其他位置即使配置了DEBUG级别的日志，也不会被输出 -->
            <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
                <level>INFO</level>
            </filter>
            <encoder>
                <Pattern>${CONSOLE_LOG_PATTERN}</Pattern>
                <!-- 设置字符集 -->
                <charset>UTF-8</charset>
            </encoder>
        </appender>
        <!--输出到文件-->
        <!-- 时间滚动输出 level为 INFO 日志 -->
        <appender name="INFO_FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
            <!-- 正在记录的日志文件的路径及文件名 -->
            <file>${log.path}/log_info.log</file>
            <!--日志文件输出格式-->
            <encoder>
                <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
                <charset>UTF-8</charset>
            </encoder>
            <!-- 日志记录器的滚动策略，按日期，按大小记录 -->
            <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
                <!-- 每天日志归档路径以及格式 -->
                <fileNamePattern>${log.path}/info/log-info-%d{yyyy-MM-dd}.%i.log</fileNamePattern>
                <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                    <maxFileSize>100MB</maxFileSize>
                </timeBasedFileNamingAndTriggeringPolicy>
                <!--日志文件保留天数-->
                <maxHistory>15</maxHistory>
            </rollingPolicy>
            <!-- 此日志文件只记录info级别的 -->
            <filter class="ch.qos.logback.classic.filter.LevelFilter">
                <level>INFO</level>
                <onMatch>ACCEPT</onMatch>
                <onMismatch>DENY</onMismatch>
            </filter>
        </appender>
        <!-- 时间滚动输出 level为 WARN 日志 -->
        <appender name="WARN_FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
            <!-- 正在记录的日志文件的路径及文件名 -->
            <file>${log.path}/log_warn.log</file>
            <!--日志文件输出格式-->
            <encoder>
                <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
                <charset>UTF-8</charset> <!-- 此处设置字符集 -->
            </encoder>
            <!-- 日志记录器的滚动策略，按日期，按大小记录 -->
            <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
                <fileNamePattern>${log.path}/warn/log-warn-%d{yyyy-MM-dd}.%i.log</fileNamePattern>
                <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                    <maxFileSize>100MB</maxFileSize>
                </timeBasedFileNamingAndTriggeringPolicy>
                <!--日志文件保留天数-->
                <maxHistory>15</maxHistory>
            </rollingPolicy>
            <!-- 此日志文件只记录warn级别的 -->
            <filter class="ch.qos.logback.classic.filter.LevelFilter">
                <level>warn</level>
                <onMatch>ACCEPT</onMatch>
                <onMismatch>DENY</onMismatch>
            </filter>
        </appender>
        <!-- 时间滚动输出 level为 ERROR 日志 -->
        <appender name="ERROR_FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
            <!-- 正在记录的日志文件的路径及文件名 -->
            <file>${log.path}/log_error.log</file>
            <!--日志文件输出格式-->
            <encoder>
                <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
                <charset>UTF-8</charset> <!-- 此处设置字符集 -->
            </encoder>
            <!-- 日志记录器的滚动策略，按日期，按大小记录 -->
            <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
                <fileNamePattern>${log.path}/error/log-error-%d{yyyy-MM-dd}.%i.log</fileNamePattern>
                <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                    <maxFileSize>100MB</maxFileSize>
                </timeBasedFileNamingAndTriggeringPolicy>
                <!--日志文件保留天数-->
                <maxHistory>15</maxHistory>
            </rollingPolicy>
            <!-- 此日志文件只记录ERROR级别的 -->
            <filter class="ch.qos.logback.classic.filter.LevelFilter">
                <level>ERROR</level>
                <onMatch>ACCEPT</onMatch>
                <onMismatch>DENY</onMismatch>
            </filter>
        </appender>
        <!--
          <logger>用来设置某一个包或者具体的某一个类的日志打印级别、以及指定<appender>。
          <logger>仅有一个name属性，
          一个可选的level和一个可选的addtivity属性。
          name:用来指定受此logger约束的某一个包或者具体的某一个类。
          level:用来设置打印级别，大小写无关：TRACE, DEBUG, INFO, WARN, ERROR, ALL 和 OFF，
             如果未设置此属性，那么当前logger将会继承上级的级别。
        -->
        <!--
          使用mybatis的时候，sql语句是debug下才会打印，而这里我们只配置了info，所以想要查看sql语句的话，有以下两种操作：
          第一种把<root level="INFO">改成<root level="DEBUG">这样就会打印sql，不过这样日志那边会出现很多其他消息
          第二种就是单独给mapper下目录配置DEBUG模式，代码如下，这样配置sql语句会打印，其他还是正常DEBUG级别：
         -->
        <!--开发环境:打印控制台-->
        <springProfile name="dev">
            <!--可以输出项目中的debug日志，包括mybatis的sql日志-->
            <logger name="com.guli" level="INFO" />
            <!--
              root节点是必选节点，用来指定最基础的日志输出级别，只有一个level属性
              level:用来设置打印级别，大小写无关：TRACE, DEBUG, INFO, WARN, ERROR, ALL 和 OFF，默认是DEBUG
              可以包含零个或多个appender元素。
            -->
            <root level="INFO">
                <appender-ref ref="CONSOLE" />
                <appender-ref ref="INFO_FILE" />
                <appender-ref ref="WARN_FILE" />
                <appender-ref ref="ERROR_FILE" />
            </root>
        </springProfile>
        <!--生产环境:输出到文件-->
        <springProfile name="pro">
            <root level="INFO">
                <appender-ref ref="CONSOLE" />
                <appender-ref ref="DEBUG_FILE" />
                <appender-ref ref="INFO_FILE" />
                <appender-ref ref="ERROR_FILE" />
                <appender-ref ref="WARN_FILE" />
            </root>
        </springProfile>
    </configuration>
```

在application中指定开发环境，不然与上面的日志配置文件冲突，项目无法启动

```yaml
server:
  port: 9999
logging:
  root:
    level: debug
spring:
  profiles:
    active: dev
```

#### 3、配置文件中数据库密码加密问题

在springboot项目中，我们会在application配置文件中加入数据库配置用户名密码，redis用户名密码等。通常我们开源项目一般不想让别人知道我们的密码等相关信息，可以每次在上传github仓库时，删除或者修改相关密码信息。但如果每次都这样，会不会太麻烦了。所以出现了这样的框架：

参考：https://www.php1.cn/detail/SpringBoot_PeiZh_a88f31cc.html

1、在项目中引入jasypt框架

```xml
<dependency>
    <groupId>com.github.ulisesbocchio</groupId>
    <artifactId>jasypt-spring-boot-starter</artifactId>
    <version>2.1.2</version>
</dependency>
```

2、在配置文件中，配置所需加密的盐

```yaml
jasypt:
  encryptor:
    password: simon_123456
```

3、创建测试类

```java
@RunWith(SpringRunner.class) //作用：让当前类在容器环境下进行测试
@SpringBootTest(classes = ProjectUtilApplication.class)
public class EncryTest {
    @Autowired
    StringEncryptor encryptor;

    @Test
    public void getPass() {
        String name = encryptor.encrypt("root");
        String password = encryptor.encrypt("toor");
        System.out.println(name+"----------------");
        System.out.println(password+"----------------");
    }
}
```

[![zfymi4.png](https://s1.ax1x.com/2022/12/11/zfymi4.png)](https://imgse.com/i/zfymi4)

4、将application中的密码相关信息更换

```yaml
spring:
  profiles:
    active: dev
  datasource:
    url: jdbc:mysql://192.168.0.104:3306/mybatis_plus?useUnicode=true&characterEncoding=utf-8
    driver-class-name: com.mysql.cj.jdbc.Driver
    username: ENC(Oo+3WaZHMlh4bM1QzAji7g==)
    password: ENC(4/w/XReKZRJSgAFHRR38IA==)
jasypt:
  encryptor:
    password: simon_123456
```

前面的ENC()是固定写法，括号里面是加密之后的字符串。

#### 4、JSR303校验参数

1、导包

```xml
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-validation</artifactId>
 </dependency>
```

2、在校验的参数字段上加上注解

```java
@Max(value = 3,message = "超过最大值3")
private Integer appLevel;
```

3、请求方法参数中加上@Valid注解

```java
 public RespResult<Void> add(@RequestBody @Valid AppInfoDTO appInfoDTO){
        return idsAppInfoService.add(appInfoDTO);
    }
```

4、自定义异常捕获

在前面的统一异常捕获类中，添加如下代码

```java
/**
     * 拦截JSR303校验异常
     * @param req
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result exception(HttpServletRequest req, MethodArgumentNotValidException e) {
        // 控制台打印异常
        e.printStackTrace();
        log(req, e);
        // 格式化错误日志
        BindingResult bindingResult = e.getBindingResult();
        FieldError fieldError = bindingResult.getFieldError();
        String message = String.format("%s",fieldError.getDefaultMessage());
        // 返回错误格式信息
        return Result.failure(message);
    }
```

**5、JSR303常用注解：**

| @Null        | 用于验证对象为null                                           |
| ------------ | ------------------------------------------------------------ |
| @NotNull     | 用于对象不能为null，无法查检长度为0的字符串                  |
| @NotBlank    | 只用于String类型上，不能为null且trim()之后的size>0           |
| @NotEmpty    | 用于集合类、String类不能为null,且size>0。但是带有空格的字符串校验不出来 |
| @Size        | 用于对象（Array,Collection,Map,String）长度是否在给定的范围之内 |
| @Length      | 用于String对象的大小必须在指定的范围内                       |
| @Pattern     | 用于String对象是否符合正则表达式的规则                       |
| @Email       | 用于String对象是否符合邮箱格式                               |
| @Min         | 用于Number和String对象是否大等于指定的值                     |
| @Max         | 用于Number和String对象是否小等于指定的值                     |
| @AssertTrue  | 用于Boolean对象是否为true                                    |
| @AssertFalse | 用于Boolean对象是否为false                                   |

**6、高级：**

参考：https://www.jb51.net/article/263438.htm

1、当我们的属性为复合属性的时候，请求方法上的参数必须是@Validated，如果还是原来的@Valid是不行的

示例：

```java
@Data
public class School{

    @NotBlank
    private String id;
    private String name;
    @Valid                // 需要加上，否则不会验证student类中的校验注解
    @NotNull 			  // 且需要触发该字段的验证才会进行嵌套验证。
    private List<Student> list;

}

@Data
public class Student {

    @NotBlank
    private String id;
    private String name;
    private int age;

}

@PostMapping("/test")
public Result test(@Validated @RequestBody School school){

}
```

2、在同一个实体类中，可能存在不同的校验情况，比如在修改和添加时，同时需要这个实体类，那么

```java
@Data
public class User {
    public interface EditGroup {
    }
    public interface AddGroup {
    }
    @NotNull(message = "id不能为空",groups = {EditGroup.class})
    private Integer id;
    @NotBlank(message = "name不能为空",groups = {AddGroup.class})
    private String name;
    @NotNull(message = "age不能为空",groups = {AddGroup.class})
    private Integer age;
}

@GetMapping("/getById")
public Object getById(@RequestBody @Validated({User.AddGroup.class}) User user){
    HashMap<Object, Object> objectObjectHashMap = new HashMap<>();
    objectObjectHashMap.put("id",user.getId());
    objectObjectHashMap.put("name","zhangsan");
    objectObjectHashMap.put("age",19);
    return objectObjectHashMap;
}
```

3、自定义校验规则：看：https://www.jb51.net/article/263438.htm

#### 5、断言工具类 

参考：https://blog.csdn.net/QingXu1234/article/details/126590702

在springboot中自带断言工具类，如org.springframework.util.Assert

```java
// 要求参数 object 必须为非空（Not Null），否则抛出异常，不予放行  
// 参数 message 参数用于定制异常信息。  
void notNull(Object object, String message)  
 
// 要求参数必须空（Null），否则抛出异常，不予『放行』。  
// 和 notNull() 方法断言规则相反  
void isNull(Object object, String message)  
 
// 要求参数必须为真（True），否则抛出异常，不予『放行』。  
void isTrue(boolean expression, String message)  
 
// 要求参数（List/Set）必须非空（Not Empty），否则抛出异常，不予放行  
void notEmpty(Collection collection, String message)  
 
// 要求参数（String）必须有长度（即，Not Empty），否则抛出异常，不予放行  
void hasLength(String text, String message)  
 
// 要求参数（String）必须有内容（即，Not Blank），否则抛出异常，不予放行  
void hasText(String text, String message)  
 
// 要求参数是指定类型的实例，否则抛出异常，不予放行  
void isInstanceOf(Class type, Object obj, String message)  
 
// 要求参数 `subType` 必须是参数 superType 的子类或实现类，否则抛出异常，不予放行  
void isAssignable(Class superType, Class subType, String message)  
```

但上面这些方法，在我们使用了JSR303参数校验之后，对我们来说就毫无作用了，我们通常就只需要一些业务上的异常断言。

自定义一个类，继承springboot的Assert，即可拥有Assert所带有的方法

```java
/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 0:59
 * @description：
 * @modified By：
 * @version: v1.0
 */
public class AssertUtil extends Assert {
    public static void isNotBlank(String name,String msg){
        if(name == null || name.trim().equalsIgnoreCase("")){
            throw new MyException(msg);
        }
    }
}
```

#### 6、项目集成swagger

参考：https://blog.csdn.net/qq_25046827/article/details/124086625

常用注解：https://blog.csdn.net/m0_37899908/article/details/125399361

**此springboot的版本为2.6.3**

1、引入jar包

```xml
<!--swagger集成-->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.9.2</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>2.9.2</version>
        </dependency>
```

2、写一个swagger配置类

```java
@Configuration    //用于构建bean定义以及初始化Spring容器。
@EnableSwagger2   //开启Swagger2
public class SwaggerConfig {
    @Bean
    public Docket docket(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()  //通过select去配置扫描接口
                //RequestHandlerSelectors配置如何扫描接口
                .apis(RequestHandlerSelectors.basePackage("com.chennq.controller"))
                //通过path来过滤，扫描以 任何路径 开头的接口
                .paths(PathSelectors.any())
                .build();
    }

//    @Bean
//    public Docket docket1(){
//        return new Docket(DocumentationType.SWAGGER_2)
//                .apiInfo(apiInfo())
//                .groupName("用户模块")  可分组
//                .enable(true)
//                .select()
//                .apis(RequestHandlerSelectors.basePackage("com.jzx.swagger.dome"))
//                .paths(PathSelectors.ant("/user/*"))
//                .build();
//    }

    private ApiInfo apiInfo(){
        Contact contact = new Contact("simon", "2830224482@qq.com", "2830224482@qq.com");
        return new ApiInfo(
                "智云科技官网前台接口文档",
                "随着互联网外包公司层出不穷，社会越来越卷。增加客户来源必然是公司的营销手段，那么在互联网如此发达的今天，企业官网成为一大解决问题。",
                "1.0",
                "2830224482@qq.com",
                contact,
                "Apache 2.0",
                "http://www.apache.org/licenses/LICENSE-2.0",
                new ArrayList());
    }
}
```

3、Spring Boot 2.6及 更高版本使用的是PathPatternMatcher，而Springfox使用的路径匹配是基于AntPathMatcher的，所以更改配置如下：

```yaml
spring:
  mvc:
    pathmatch:
      matching-strategy: ANT_PATH_MATCHER
```

4、启动访问`http://localhost:8080/swagger-ui.html`

5、常用注解：

| 注解              | 作用                           | 使用位置 |
| ----------------- | ------------------------------ | -------- |
| @Api              | 表示对类的说明常用参数         | 类上面   |
| @ApiOperation     | 说明方法的用途、作用           | 方法上面 |
| @ApiModel         | 表示一个返回响应数据的信息     | 响应类   |
| @ApiModelProperty | 描述响应类的属性               | 属性     |
| @ApiIgnore        | 忽略某个字段使之不显示在文档中 | 属性     |



#### 项目知识：

##### 7、springboot的get请求与post请求

参考：https://blog.csdn.net/hlx20080808/article/details/122318683

https://blog.csdn.net/m0_67394002/article/details/125243395

##### 8、前后端分离中文件上传

