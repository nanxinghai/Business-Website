package com.chennq.sys.service.login.impl;

import com.alibaba.fastjson.JSON;
import com.chennq.base.exception.MyException;
import com.chennq.sys.consts.Login;
import com.chennq.sys.entity.login.LoginJwt;
import com.chennq.sys.entity.login.LoginUser;
import com.chennq.sys.entity.login.User;
import com.chennq.sys.service.login.LoginService;
import com.chennq.sys.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:45
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Override
    public LoginJwt login(User user) {
        Authentication authentication = new UsernamePasswordAuthenticationToken(user.getPhonenumber(),user.getPassword());
        // 1、调用AuthticationManger的authtication方法 返回一个Authentication对象(方法会自动校验密码是否正确)
        Authentication authenticate = authenticationManager.authenticate(authentication);
        // 如果authenticate对象为空
        if(Objects.isNull(authenticate)){
            throw new MyException("用户名或密码错误!!!");
        }
        LoginUser loginUser = (LoginUser)authenticate.getPrincipal();
        // 将用户重要信息置空
        loginUser.getUser().setPassword(null);
        String userId = loginUser.getUser().getId().toString();
        // 2、将userId进行jwt加密
        String jwt = JwtUtil.createJWT(userId);
        // 3、存入redis,userId作为key,用户所有信息作为value (过期时间1天)
        stringRedisTemplate.opsForValue().set(Login.PHONENUM_INREDISTOKEN_PREFIX + userId
                , JSON.toJSONString(loginUser), 1L, TimeUnit.DAYS);
        return new LoginJwt(jwt,loginUser.getUser(),loginUser.getPermissionList());
    }
}
