package com.chennq.sys.controller.settings;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.service.settings.RoleSettingsService;
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
 * @date ：Created in 2023/3/27 22:46
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "后台角色设置功能接口")
@RestController
@RequestMapping("/sys/roleSettings")
public class RoleSettingsController {
    @Autowired
    private RoleSettingsService roleSettingsService;

    @ResultApi
    @ApiOperation("查询角色列表，分页")
    @PreAuthorize("hasAuthority('sys:roleSettings:pageListRole')")
    @PostMapping("/pageListRole")
    public PageVo<SysRole> pageListRole(@RequestBody SysRole sysRole){
        return roleSettingsService.pageListRole(sysRole);
    }
}
