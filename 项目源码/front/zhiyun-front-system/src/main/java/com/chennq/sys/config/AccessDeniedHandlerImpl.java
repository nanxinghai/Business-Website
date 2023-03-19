package com.chennq.sys.config;

import com.alibaba.fastjson.JSON;
import com.chennq.base.util.Result;
import com.chennq.sys.util.WebUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/17 23:50
 * @description：自定义security授权过程中失败处理器
 * @modified By：
 * @version: v1.0
 */
@Component
@Slf4j
public class AccessDeniedHandlerImpl implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        Result result = Result.failure("权限不足");
        String json = JSON.toJSONString(result);
        WebUtil.write(response,json);
        log.error("AccessDeniedHandlerImpl授权过程中出现异常");
    }
}
