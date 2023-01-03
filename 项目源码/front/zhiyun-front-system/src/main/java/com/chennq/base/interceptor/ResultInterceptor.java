package com.chennq.base.interceptor;

import com.chennq.base.annotation.ResultApi;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/5 22:43
 * @description：标记类(如果打上注解便标记)
 * @modified By：
 * @version: v1.0
 */
@Component
public class ResultInterceptor implements HandlerInterceptor {
    // 标记
    public static final String RESPONSE_RESULT = "result_flag";

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


