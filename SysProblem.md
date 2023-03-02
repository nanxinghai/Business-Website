## 项目所遇问题及解决方案

### 1、Springboot使用hikari连接池，在项目启动后第一次访问 获取连接池速度很慢

Springboot使用hikari连接池，在项目启动后第一次访问 获取连接池速度很慢，但是第二次很快（是因为第一次拿到连接池后，直接从连接池中获取数据库连接，所以第二次很快）

![VLIda.png](https://i.imgtg.com/2023/03/02/VLIda.png)

1、默认情况下dispatcherServlet是懒加载的，意思就是web容器会在项目重新启动后的第一次请求接口时初始化dispatcherServlet（初始化是需要时间的），

所以导致第一次请求速度就会慢一些

2、hikari连接池，第一次请求时才会初始化连接池，我们设置最小连接池数就可以

