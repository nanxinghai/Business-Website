package com.chennq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/4 1:11
 * @description：智云科技官网
 * @modified By：
 * @version: v1.0
 */
@SpringBootApplication
@MapperScan({"com.chennq.mapper","com.chennq.sys.mapper.*"})
public class ZYWebsiteApplication {
    public static void main(String[] args) {
        SpringApplication.run(ZYWebsiteApplication.class,args);
    }
}
