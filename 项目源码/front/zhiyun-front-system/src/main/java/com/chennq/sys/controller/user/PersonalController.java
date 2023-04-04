package com.chennq.sys.controller.user;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.service.user.PersonalService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "后台个人中心功能接口")
@RestController
@RequestMapping("/sys/personal")
public class PersonalController {

    @Autowired
    private PersonalService personalService;

    @ResultApi
    @ApiOperation("查询当前个人信息")
    @PreAuthorize("hasAuthority('sys:personal:getPersonInfo')")
    @PostMapping("/getPersonInfo")
    public SysUser getPersonInfo(@RequestBody SysUser sysUser){
        return personalService.getPersonInfo(sysUser);
    }


    @ResultApi
    @ApiOperation("更新当前个人信息")
    @PreAuthorize("hasAuthority('sys:personal:editUser')")
    @PostMapping("/editUser")
    public void editUser(@RequestBody SysUser sysUser){
        personalService.editUser(sysUser);
    }


}
