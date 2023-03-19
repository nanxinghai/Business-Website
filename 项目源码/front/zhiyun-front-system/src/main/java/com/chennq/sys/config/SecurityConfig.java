package com.chennq.sys.config;

import com.chennq.sys.filter.JwtAuthticationTokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:20
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Configuration
// 开启SpringSecurity注解式授权
@EnableGlobalMethodSecurity(prePostEnabled =true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private JwtAuthticationTokenFilter jwtAuthticationTokenFilter;
    @Autowired
    private AuthenticationEntryPoint authenticationEntryPoint;
    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    /**
     * 将AuthenticationManager交给spring管理
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //关闭csrf
                .csrf().disable()
                //不通过Session获取SecurityContext
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                // 对于登录接口 允许匿名访问
                .antMatchers("/sys/login",
                        "/sys/getSmsCode",
                        "/sys/codeLogin",
                        "/sys/weChatCallBack").anonymous()
                .antMatchers("/sys/**/**").authenticated()
                // 除上面外的所有请求均放行
                .anyRequest().permitAll();
        //允许跨域
        http.cors();
        //把token校验过滤器添加到过滤器链中(准确来说，添加到security之前)
        http.addFilterBefore(jwtAuthticationTokenFilter, UsernamePasswordAuthenticationFilter.class);
        // 配置自定义异常处理器
        http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint)
                .accessDeniedHandler(accessDeniedHandler);
    }
}
