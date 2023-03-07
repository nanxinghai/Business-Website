package com.chennq.sys.controller.login;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Contact;
import com.chennq.sys.entity.login.CodeLogin;
import com.chennq.sys.entity.login.LoginJwt;
import com.chennq.sys.entity.login.User;
import com.chennq.sys.entity.login.vo.WxCodeVo;
import com.chennq.sys.service.login.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:41
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "用户登录、登出功能接口")
@RestController
@RequestMapping("/sys")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @ResultApi
    @ApiOperation("登录接口")
    @PostMapping("/login")
    public LoginJwt login(@RequestBody User user){
        return loginService.login(user);
    }

    @ResultApi
    @ApiOperation("获取登录验证码")
    @PostMapping("/getSmsCode")
    public void getSmsCode(@RequestBody CodeLogin codeLogin) throws Exception{
        loginService.getSmsCode(codeLogin.getPhone());
    }

    @ResultApi
    @ApiOperation("验证码登录")
    @PostMapping("/codeLogin")
    public LoginJwt codeLogin(@RequestBody CodeLogin codeLogin) throws Exception{
        return loginService.codeLogin(codeLogin);
    }


    @ResultApi
    @ApiOperation("微信回调地址")
    @PostMapping("/weChatCallBack")
    public LoginJwt weChatCallBack(@RequestBody Map<String,String> map) throws Exception{
        return loginService.weChatCallBack(map.get("code"),map.get("state"));
    }

}
