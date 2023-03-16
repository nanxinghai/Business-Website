## 项目所遇问题及解决方案

### 1、Springboot使用hikari连接池，在项目启动后第一次访问 获取连接池速度很慢

Springboot使用hikari连接池，在项目启动后第一次访问 获取连接池速度很慢，但是第二次很快（是因为第一次拿到连接池后，直接从连接池中获取数据库连接，所以第二次很快）

![VLIda.png](https://i.imgtg.com/2023/03/02/VLIda.png)

1、默认情况下dispatcherServlet是懒加载的，意思就是web容器会在项目重新启动后的第一次请求接口时初始化dispatcherServlet（初始化是需要时间的），

所以导致第一次请求速度就会慢一些

2、hikari连接池，第一次请求时才会初始化连接池，我们设置最小连接池数就可以

```yml
spring:
  profiles:
    active: dev
  datasource:
    url: jdbc:mysql://120.48.94.210:3306/website?characterEncoding=utf-8&useSSL=false
    type: com.zaxxer.hikari.HikariDataSource
    username: ENC(kPKnRADlut5UtUqytqnh9g==)
    password: ENC(2AgKiQfCMd1L87szsCXiRA==)
    #连接池
    hikari:
      minimum-idle: 1
      maximum-pool-size: 5
      auto-commit: true
      idle-timeout: 30000
      pool-name: DatebookHikariCP
      max-lifetime: 120000
      connection-timeout: 30000
      connection-test-query: SELECT 1
  mvc:
    # 设置dispatcherServlet在项目启动时就加载 ，而不是懒加载
    servlet:
      load-on-startup: 1
```

3、连接池我们可以让他在初始化项目的时候进行连接，利用@PostConstruct注解，他的执行时机会在spring容器启动后

```java
@Slf4j
@Component
public class InitDataSource {
    @Autowired
    private InitMapper initMapper;

    @PostConstruct
    public void init(){
        log.info("初始化hikari连接池");
        // 初始化hikari连接池
        initMapper.Init();
    }
}
```

### 2、验证码登录注意点

要解决的问题：

1、验证码60秒才能再次发送

2、验证码5分钟过期

![image-20230304145444773](C:\Users\86134\AppData\Roaming\Typora\typora-user-images\image-20230304145444773.png)

### 3、第三方网站接入微信扫码登录

参考博客：https://blog.csdn.net/qq_35771266/article/details/119794098

参考博客：https://blog.csdn.net/qq_35771266/article/details/119794542

参考wxjava实现：https://blog.csdn.net/yingshuanglu2564/article/details/99306194

微信官方文档：https://developers.weixin.qq.com/doc/oplatform/Website_App/WeChat_Login/Wechat_Login.html

1、首先要完成微信扫码登录，必须在微信开发平台申请appid和secret

https://open.weixin.qq.com/

2、其实官方文档已经说得比较清楚了

```text
1. 第三方发起微信授权登录请求，微信用户允许授权第三方应用后，微信会拉起应用或重定向到第三方网站，并且带上授权临时票据code参数；
2. 通过code参数加上AppID和AppSecret等，通过API换取access_token；
3. 通过access_token进行接口调用，获取用户基本数据资源或帮助用户实现基本操作。
```

**一共是两种方式，但两种方式的原理基本相同，第一种是在原来的网页打开一个新的标签页，标签页中涵盖微信提供的二维码。**

第一种方式需要后端提供一个微信二维码的地址，返回给前端，前端调用window.open打开一个新的标签页

**第二种是在自己的网页中内嵌微信提供的二维码。将使用微信提供的js库，自动获取微信的扫描二维码**

![YJWlU.png](https://i.imgtg.com/2023/03/07/YJWlU.png)

3、重点讲解在自己的网页中内嵌二维码；

例如：![YhqW1.png](https://i.imgtg.com/2023/03/05/YhqW1.png)

3.1、将页面引入 http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js 这个js，由微信官方提供

在需要使用微信登录的地方实例以下JS对象：

```js
var obj = new WxLogin({
        self_redirect:true,
        id:"login_container", 
        appid: "", 
        scope: "", 
        redirect_uri: "",
        state: "",
        style: "",
        href: ""
 });
```

```js
// 举个例子
var obj = new WxLogin({           
                              self_redirect:false,
                              id:"wxPng", 
                              appid: "wxd853562a0548a7d0", 
                              scope: "snsapi_login", 
                              redirect_uri: encodeURIComponent("http://bugtracker.itsource.cn"),
                              state: "",
                              style: "black",
                              href: "data:text/css;base64,LmltcG93ZXJCb3ggLnRpdGxlewogIGRpc3BsYXk6IG5vbmU7Cn0KCi5pbXBvd2VyQm94IC53YWl0aW5nIC5pbmZvIHsKICBkaXNwbGF5OiBub25lOwp9CgouaW1wb3dlckJveCAud2FpdGluZyAud3JwX2NvZGUgewogIG1hcmdpbjogMCBhdXRvOyAKICB3aWR0aDogMjAwcHg7CiAgYm9yZGVyOiBub25lOwp9CgouaW1wb3dlckJveCAud2FpdGluZyAucXJjb2RlIHsKICBib3JkZXI6IDA7CiAgd2lkdGg6IDEwMCU7Cn0="
                            });
```

参数	是否必须	说明
self_redirect	否	true：手机点击确认登录后可以在 iframe 内跳转到 redirect_uri，false：手机点击确认登录后可以在 top window 跳转到 redirect_uri。默认为 false。
id	是	第三方页面显示二维码的容器id
appid	是	应用唯一标识，在微信开放平台提交应用审核通过后获得
scope	是	应用授权作用域，拥有多个作用域用逗号（,）分隔，网页应用目前仅填写snsapi_login即可
redirect_uri	是	重定向地址，需要进行UrlEncode
state	否	用于保持请求和回调的状态，授权请求后原样带回给第三方。该参数可用于防止csrf攻击（跨站请求伪造攻击），建议第三方带上该参数，可设置为简单的随机数加session进行校验
style	否	提供"black"、"white"可选，默认为黑色文字描述。详见文档底部FAQ
href	否	自定义样式链接，第三方可根据实际需求覆盖默认样式。详见文档底部FAQ



我们这里需要自定义css，可以使用href属性字段，将css发布到公网上，或者将css写好之后，进行base编码之后。直接赋值。例如：

```
// 自定义样式
.impowerBox .title {
 display: none;
}
.impowerBox .status.status_browser {
 display: none;
}
.impowerBox .qrcode {
 border: none;
 width: 200px;
 height: 200px;
}
.impowerBox .status{
 display: none
}
```

进行base64编码：

href必须使用 text/css模式,生成的base64添加到'data:text/css;base64,'后面就可以了

```js
href="data:text/css;base64,
LmltcG93ZXJCb3ggLnRpdGxlIHsNCiAgZGlzcGxheTogbm9uZTsNCn0NCi5pbXBvd2VyQm94IC5zdGF0dXMuc3RhdHVzX2Jyb3dzZXIgew0KICBkaXNwbGF5OiBub25lOw0KfQ0KLmltcG93ZXJCb3ggLnFyY29kZSB7DQogIGJvcmRlcjogbm9uZTsNCiAgd2lkdGg6IDIwMHB4Ow0KICBoZWlnaHQ6IDIwMHB4Ow0KfQ0KLmltcG93ZXJCb3ggLnN0YXR1c3sNCiAgZGlzcGxheTogbm9uZQ0KfQ=="
```

3.2、**在用户扫完码确认授权后，页面会跳转到你之前设置的回调地址，如果在本地开发的话 ，可以改host文件，将127.0.0.1指向bugtracker.itsource.cn地址**

**他会携带一个code和state参数，这个时候你在这个页面初始化时，检测地址url是否有code和state参数，如果有，那就往后台发送请求，后台会做两件事**

1、通过code参数加上AppID和AppSecret等，通过API换取access_token；

```text
https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
```

返回结果：

```text
{ 
"access_token":"ACCESS_TOKEN", 
"expires_in":7200, 
"refresh_token":"REFRESH_TOKEN",
"openid":"OPENID", 
"scope":"SCOPE",
"unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
}
```

**openid就是微信用户的唯一标识**

2、通过access_token进行接口调用，获取用户基本数据资源或帮助用户实现基本操作。



代码演示：



### 4、PV和UV

pv:pageViews，页面访问次数，同一个电脑访问次数可以叠加

uv：uniqueVisitor，独立访问客户，同一个电脑访问次数不算叠加

