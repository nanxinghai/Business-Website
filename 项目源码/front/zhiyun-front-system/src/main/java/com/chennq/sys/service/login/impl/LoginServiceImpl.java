package com.chennq.sys.service.login.impl;

import com.alibaba.fastjson.JSON;
import com.chennq.base.exception.MyException;
import com.chennq.sys.consts.Login;
import com.chennq.sys.consts.WxParams;
import com.chennq.sys.entity.login.*;
import com.chennq.sys.entity.login.vo.WxCodeVo;
import com.chennq.sys.mapper.login.PermissionMapper;
import com.chennq.sys.mapper.login.UserMapper;
import com.chennq.sys.service.UserDetailServiceImpl;
import com.chennq.sys.service.login.LoginService;
import com.chennq.sys.util.JwtUtil;
import com.chennq.sys.util.MobileNumberCheckUtil;
import com.chennq.sys.util.SendSmsCodeUtil;
import com.chennq.sys.util.VerificationCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

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
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SendSmsCodeUtil sendSmsCodeUtil;
    @Autowired
    private UserDetailServiceImpl userDetailService;
    @Autowired
    private WxParams wxParams;
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

    @Override
    public void getSmsCode(String phone) throws Exception{
        // 手机号校验
        if(!MobileNumberCheckUtil.checkPhone(phone)){
            throw new MyException("手机号不合法！！！");
        }
        // 1、检查手机号是否为系统用户
        User userFormDb = userMapper.getUserByUserNameOrEmail(phone);
        if(Objects.isNull(userFormDb)){
            throw new MyException("该手机号未注册！！！");
        }
        // 检查60秒之前是否发送过验证码
        String codeBefore = stringRedisTemplate.opsForValue().get(phone);
        if(StringUtils.hasText(codeBefore)){
            throw new Exception("60s之内不能重复发送验证码！！！");
        }
        // 2、生成6位随机数验证码,调用阿里云接口发送验证码
        String code = VerificationCodeUtil.VerificationCode();
        try {
            sendSmsCodeUtil.sendCode(phone,code);
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("阿里云发生短信异常");
        }
        // 3、将手机号作为key，6位数验证码作为value存入redis中（60秒过期）
        stringRedisTemplate.opsForValue().set(phone,code,60,TimeUnit.SECONDS);
        // 4、同时将验证码再次存到redis中，key为“手机号+expiration”value是验证码(5分钟有效)
        stringRedisTemplate.opsForValue().set(phone + Login.CODEEXPIRATION_INREDIS_KEY,code,5,TimeUnit.MINUTES);
    }

    @Override
    public LoginJwt codeLogin(CodeLogin codeLogin) {
        String phone = codeLogin.getPhone();
        String code = codeLogin.getCode();
        // 1、根据  手机号+expiration 去redis查询验证码是否正确
        String codeFromRd = stringRedisTemplate.opsForValue().get(phone + Login.CODEEXPIRATION_INREDIS_KEY);
        if(!StringUtils.hasText(codeFromRd)){
            throw new MyException("验证码已过期，请重新发送");
        }
        if(!codeFromRd.equalsIgnoreCase(code)){
            throw new MyException("验证码错误");
        }
        LoginUser loginUser = (LoginUser) userDetailService.loadUserByUsername(phone);
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

    @Override
    public LoginJwt weChatCallBack(String code, String state) throws Exception{
        if(!StringUtils.hasText(code)){
            throw new MyException("code为空，不合法");
        }
        WxAccessToken accessToken = wxParams.getAccessToken(code);
        User userFromDB = userMapper.getUserByOpenid(accessToken.getOpenid());
        if(Objects.isNull(userFromDB)){
            throw new MyException("该微信扫码用户不是系统用户");
        }
        String userId = userFromDB.getId().toString();
        LoginUser loginUser = userDetailService.getLoginUserByUser(userFromDB);
        // 将用户重要信息置空
        loginUser.getUser().setPassword(null);
        // 2、将userId进行jwt加密
        String jwt = JwtUtil.createJWT(userId);
        // 3、存入redis,userId作为key,用户所有信息作为value (过期时间1天)
        stringRedisTemplate.opsForValue().set(Login.PHONENUM_INREDISTOKEN_PREFIX + userId
                , JSON.toJSONString(loginUser), 1L, TimeUnit.DAYS);
        return new LoginJwt(jwt,loginUser.getUser(),loginUser.getPermissionList());
    }

}
