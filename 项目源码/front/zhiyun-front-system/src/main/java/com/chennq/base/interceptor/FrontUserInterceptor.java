package com.chennq.base.interceptor;

import com.alibaba.fastjson.JSON;
import com.chennq.base.util.IpUtil;
import com.chennq.entity.Log;
import com.chennq.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Map;

@Component
public class FrontUserInterceptor implements HandlerInterceptor {
    @Autowired
    private LogService logService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request);
        // 拦截请求 做log处理
        Log log = IpUtil.getLog(request);
        String servletPath = request.getServletPath();
        if(servletPath.contains("log")){
            // 说明是菜单请求
            Map<String, String[]> parameterMap = request.getParameterMap();
            String[] param = parameterMap.get("0");
            String paramString = Arrays.toString(param).replace("[","").replace("]","");
            Map map = JSON.parseObject(paramString, Map.class);
            log.setContent("点击菜单 [ " + map.get("menuname") + " ]");
            log.setType("1");
        }else{
            log.setContent("数据请求");
            log.setType("0");
        }
        logService.insert(log);
        return true;
    }
}
