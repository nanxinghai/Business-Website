package com.chennq.base.config;

import com.chennq.base.interceptor.FrontUserInterceptor;
import com.chennq.base.interceptor.ResultInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/6 0:02
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Configuration
public class MyWebConfig implements WebMvcConfigurer {

    @Bean
    public FrontUserInterceptor getFrontUserInterceptor(){
        return new FrontUserInterceptor();
    }


    /**
     * 拦截全部
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new ResultInterceptor()).addPathPatterns("/**");
        // 拦截前台请求 除去后台请求不会拦截 /sys/**/**:排除sys开头的无论后面有几层的数据
        registry.addInterceptor(getFrontUserInterceptor()).addPathPatterns("/**").excludePathPatterns("/sys/**/**").excludePathPatterns("/error");
        // 上方排除error是因为,springsecurity会优先经过他自己的过滤器，如果鉴权失败，他会将请求路径更改为/error
    }
}
