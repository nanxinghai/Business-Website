package com.chennq.sys.config;

import com.alibaba.fastjson.JSON;
import com.chennq.base.exception.MyException;
import com.chennq.base.util.Result;
import com.chennq.sys.util.WebUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/18 0:05
 * @description：自定义security认证过程中失败处理器
 * @modified By：
 * @version: v1.0
 */
@Component
@Slf4j
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        Result result = Result.failure("非法权限");
        String json = JSON.toJSONString(result);
        WebUtil.write(response,json);
        log.error("AuthenticationEntryPointImpl认证过程中出现异常");
    }
}
