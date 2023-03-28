package com.chennq.sys.controller.settings;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.service.settings.PermissionSettingsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "后台权限功能接口")
@RestController
@RequestMapping("/sys/permissionSettings")
public class PermissionSettingsController {

    @Autowired
    private PermissionSettingsService permissionSettingsService;

    @ResultApi
    @ApiOperation("查询权限列表，分页")
    @PreAuthorize("hasAuthority('sys:permissionSettings:pageListPer')")
    @PostMapping("/pageListPer")
    public PageVo<SysMenu> pageListPer(@RequestBody SysMenu sysMenu){
        return permissionSettingsService.pageListPer(sysMenu);
    }

    @ResultApi
    @ApiOperation("添加权限列表")
    @PreAuthorize("hasAuthority('sys:permissionSettings:addOnePer')")
    @PostMapping("/addOnePer")
    public void addOnePer(@RequestBody SysMenu sysMenu){
        permissionSettingsService.addOnePer(sysMenu);
    }

    @ResultApi
    @ApiOperation("编辑权限列表")
    @PreAuthorize("hasAuthority('sys:permissionSettings:editOnePer')")
    @PostMapping("/editOnePer")
    public void editOnePer(@RequestBody SysMenu sysMenu){
        permissionSettingsService.editOnePer(sysMenu);
    }


    @ResultApi
    @ApiOperation("停用权限数据")
    @PreAuthorize("hasAuthority('sys:permissionSettings:stopStatus')")
    @PostMapping("/stopStatus")
    public void stopStatus(@RequestBody SysMenu sysMenu){
        permissionSettingsService.stopStatus(sysMenu);
    }

    @ResultApi
    @ApiOperation("恢复权限数据")
    @PreAuthorize("hasAuthority('sys:permissionSettings:returnStatus')")
    @PostMapping("/returnStatus")
    public void returnStatus(@RequestBody SysMenu sysMenu){
        permissionSettingsService.returnStatus(sysMenu);
    }

}
