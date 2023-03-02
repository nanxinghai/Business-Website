package com.chennq.sys.controller.login;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Contact;
import com.chennq.sys.entity.login.LoginJwt;
import com.chennq.sys.entity.login.User;
import com.chennq.sys.service.login.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
}
