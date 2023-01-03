package com.chennq.base.advice;

import com.chennq.base.annotation.ResultApi;
import com.chennq.base.exception.MyException;
import com.chennq.base.interceptor.ResultInterceptor;
import com.chennq.base.util.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;
import javax.servlet.http.HttpServletRequest;

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
    public Result exception(HttpServletRequest request, Exception e) {
        // 控制台打印异常
        e.printStackTrace();
        log(request,e);
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
    public Result exception(HttpServletRequest request, MyException e) {
        // 控制台打印异常
        e.printStackTrace();
        log(request,e);
        // 返回错误格式信息
        return Result.failure(e.getMessage());
    }

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

}
