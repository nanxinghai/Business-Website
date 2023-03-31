package com.chennq.base.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 19:12
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Configuration    //用于构建bean定义以及初始化Spring容器。
@EnableSwagger2   //开启Swagger2
public class SwaggerConfig {
    @Bean
    public Docket docket(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("前台接口")
                .select()  //通过select去配置扫描接口
                //RequestHandlerSelectors配置如何扫描接口
                .apis(RequestHandlerSelectors.basePackage("com.chennq.controller"))
                //通过path来过滤，扫描以 任何路径 开头的接口
                .paths(PathSelectors.any())
                .build();
    }

    @Bean
    public Docket docket1(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("后台接口")
                .enable(true)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.chennq.sys.controller"))
//                .paths(PathSelectors.ant("/user/*"))
                .paths(PathSelectors.any())
                .build();
    }

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
