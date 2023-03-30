package com.chennq.sys.controller.settings;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.service.settings.UserSettingsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/20 22:56
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "后台用户设置功能接口")
@RestController
@RequestMapping("/sys/userSettings")
public class UserSettingsController {

    @Autowired
    private UserSettingsService userSettingsService;

    @ResultApi
    @ApiOperation("查询用户列表，分页")
    @PreAuthorize("hasAuthority('sys:userSettings:pageListUser')")
    @PostMapping("/pageListUser")
    public PageVo<SysUser> pageListUser(@RequestBody SysUser sysUser){
        return userSettingsService.pageListUser(sysUser);
    }

    @ResultApi
    @ApiOperation("添加用户列表")
    @PreAuthorize("hasAuthority('sys:userSettings:addOneUser')")
    @PostMapping("/addOneUser")
    public void addOneUser(@RequestBody SysUser sysUser){
        userSettingsService.addOneUser(sysUser);
    }


}
