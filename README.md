# 鹤岗智云科技有限责任公司官网项目（学习使用）

### 项目背景简介

鹤岗智云科技有限责任公司官网--仅供学习使用，一切违法行为，后果自负

> 鹤岗智云科技有限责任公司成立于2009年，专注于中国软件和行业信息化服务，俗称：“项目外包公司”。(虚构)
>
> 外包公司指企业在管理系统实施过程中，把那些非核心的部门或业务外包给相应的专业公司，这样能大量节省成本，有利于高效管理。

随着互联网外包公司层出不穷，社会越来越卷。增加客户来源必然是公司的营销手段，那么在互联网如此发达的今天，企业官网成为一大解决问题。

企业官网带来的好处：

1、企业官网是公司的形象，开展网络营销的一部分。

2、企业官网能更好的介绍公司的实际情况、产品展示、企业的联系方式。

3、企业官网是企业做好SEO的必要工具。

4、企业官网是企业推广、引流的方法之一，能更多的吸引客户。

扩宽市场宣传、拉近客户的距离、树立企业形象都是企业官网的重大作用。



项目UI参考凡客建站：https://jz.fkw.com/ （侵权可删）

### 整体项目

前端相关技术栈：Vue2全家桶（Vue2、Vue-Router3、Vuex3、Axios）+UI库（ElementUI）+动画效果（FullPage整屏滚动组件、Animate动画）

后端相关技术栈：SpringBoot2、SpringSecurity、MybatisPlus

整体项目分为前台和后台，前台为用户展示页面，即企业官网，后台为管理员配置前台页面。

**前台静态部署地址：https://nanxinghai.github.io/zhiyun/**

**后台并未部署，但项目UI预览地址：https://mastergo.com/goto/pKHMWjbG?file=86167079900867** 

后台页面相关截图：

[![6g3sK.png](https://i.imgtg.com/2023/04/07/6g3sK.png)](https://imgtg.com/image/6g3sK)

[![6gwoa.png](https://i.imgtg.com/2023/04/07/6gwoa.png)](https://imgtg.com/image/6gwoa)

###### 如果你也想拉取项目本地运行，步骤：

```
git clone https://github.com/nanxinghai/Business-Website.git
```

[![6mebM.png](https://i.imgtg.com/2023/04/07/6mebM.png)](https://imgtg.com/image/6mebM)

使用vscode分别打开两个项目，zhiyun_front(前台前端)和zhiyun_sys_front(后台前端)

1、使用npm install 安装项目依赖,两个都要安装

```
npm install
```

2、运行项目npm run serve

```
npm run serve
```

3、使用idea打开zhiyun-front-system，先让idea安装pom依赖

4、找到sql文件夹，将sql文件运行在数据库中，会创建7张表

5、找到后台项目的application.yml配置文件，修改redis，mysql，微信appkey和阿里云短信appkey

注意：数据库的账号密码，需在测试类中加密后填写至application.yml中，只需替换ENC(kPKnRADlut5UtUqytqnh9g==)中的kPKnRADlut5UtUqytq...即可

具体可百度 java的 jasypt框架

6、运行后端项目

7、打开浏览器：localhost:8081（前台项目）、localhost:80（后台项目）

###### 项目中我所遇到的问题（具体可以查看根目录下的其他md文档）：

1、前后端分离中，后端都会统一返回类似这样的结构

```
{
	code：0，
	msg：‘success’，
	data：[
		{id:1,name:'zhangsan',age:18}
	]
}
```

如果每次都自己去new，或者调用静态方法Result.success()。是不是太麻烦了，于是写了一个自定义注解，只要在方法上添加注解，即可自动返回上述结构

类似这样@ResultApi

```java
    @ResultApi
    @ApiOperation("查询底部设置号码列表")
    @PreAuthorize("hasAuthority('sys:foot:pageList')")
    @PostMapping("/pageList")
    public PageVo<SysPhone> pageList(@RequestBody SysPhone sysPhone){
        return sysFootService.pageList(sysPhone);
    }
```

思路是将其注解的方法的请求体中添加标识，然后在返回拦截中查询请求体，如果请求体中包含该标识，那么就修改返回体内容

2、前台整屏滚动组件FullPage

3、项目的图片、视频等资源并未使用第三方服务，这其实在前后端分离中是相当麻烦的，后期会针对MinIO学习

### 感受

总体来说，这次的项目学习经历了很长时间从2022-11-9到2023-4-6

[![6m4mB.png](https://i.imgtg.com/2023/04/07/6m4mB.png)](https://imgtg.com/image/6m4mB)

[![6mDVs.png](https://i.imgtg.com/2023/04/07/6mDVs.png)](https://imgtg.com/image/6mDVs)

你说学习到了很多东西吧 好像也不多，可能会更熟悉SpringSecurity一些了，但是其中的oauth，单点登录，还是懵的

不知不觉，其实已经毕业两年了，从开始的萌新，到现在懂一点点的萌新。记得刚开始，在学校的学习是大杂烩，python，php，java，前端

现在是主攻java和前端了，对技术的认知也比以前清晰了。但我还是些许迷茫，我会看到别人独立写框架，独立上线软件的光辉，我时常很羡慕他们，

但是我也知道别人经历过你看不见的风雨，技术都是慢慢积累的，活到老，学到老，互联网行业是一个不断更新的行业，只有通过努力不懈的学习，才能跟得上时代的步伐。

​		有时候会刷知乎，在知乎上看到一句话  

[![6mEAa.png](https://i.imgtg.com/2023/04/07/6mEAa.png)](https://imgtg.com/image/6mEAa)

我也制定了一些目标，这样起码在完成过程中会有成就感。

1、熟悉若依框架，并后期自己写类似若依

2、下半年的软考中级

3、前后端分离的图片，视频服务，MinIO

4、重学前端基础

5、java微服务及中间件

我在昨天晚上项目完成时，比了个耶，即是对今天这个项目的完结，也是对未来的期许

最后：这片绿茵从不缺乏天才，努力才是唯一的入场券

[![6mGQS.jpg](https://i.imgtg.com/2023/04/07/6mGQS.jpg)](https://imgtg.com/image/6mGQS)
