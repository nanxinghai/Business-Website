package com.chennq.sys.filter;

import com.alibaba.fastjson.JSON;
import com.chennq.base.exception.MyException;
import com.chennq.base.util.Result;
import com.chennq.sys.consts.Login;
import com.chennq.sys.entity.login.LoginUser;
import com.chennq.sys.util.JwtUtil;
import com.chennq.sys.util.WebUtil;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/28 23:02
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Slf4j
@Component
public class JwtAuthticationTokenFilter extends OncePerRequestFilter {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // 1、将请求头header中token取出，解析出userId
        String token = request.getHeader("token");
        if(!StringUtils.hasText(token)){
            filterChain.doFilter(request,response);
            return;
        }
        String userId;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            userId = claims.getSubject();
        } catch (Exception e) {
            Result result = Result.failure("token不合法");
            String json = JSON.toJSONString(result);
            WebUtil.write(response,json);
            e.printStackTrace();
            log.error("token不合法");
            throw new MyException("token不合法");
        }
        // 2、从redis中根据userId取出用户信息
        String userStringJson = stringRedisTemplate.opsForValue().get(Login.PHONENUM_INREDISTOKEN_PREFIX + userId);
        LoginUser loginUser = JSON.parseObject(userStringJson, LoginUser.class);
        if(Objects.isNull(loginUser)){
            Result result = Result.failure("用户未登录");
            String json = JSON.toJSONString(result);
            WebUtil.write(response,json);
            log.error("用户未登录");
            throw new MyException("用户未登录");
        }
        // 3、将用户信息存入SecurityContext中
        Authentication usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(loginUser,null,loginUser.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
        // 4、放行，那么后续的Securiyt内置的过滤器判断到SecurityContext中已经有值，那他就不会拦截
        // 5、重写request，修改userId为请求参数的一部分
        // 初始化自定义HttpServletRequestWrapper
        ChangeRequestWrapper changeRequestWrapper = new ChangeRequestWrapper((HttpServletRequest) request);
        // 获取所有参数集合
        Map<String, String[]> parameterMap = new HashMap<>(changeRequestWrapper.getParameterMap());
        // 修改集合中的某个参数
        parameterMap.put("createBy", new String[]{userId});
        // 将集合存到自定义HttpServletRequestWrapper
        changeRequestWrapper.setParameterMap(parameterMap);
        // 替换原本的request
        filterChain.doFilter(changeRequestWrapper,response);
    }
}
