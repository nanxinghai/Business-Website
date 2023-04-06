package com.chennq.sys.controller.front;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysMenu;
import com.chennq.sys.service.front.SysMenuService;
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
 * @date ：Created in 2023/4/5 23:29
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "后台菜单开放功能接口")
@RestController
@RequestMapping("/sys/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    @ResultApi
    @ApiOperation("查询前台菜单列表，分页")
    @PreAuthorize("hasAuthority('sys:menu:pageList')")
    @PostMapping("/pageList")
    public PageVo<SysMenu> pageList(@RequestBody SysMenu sysMenu){
        return sysMenuService.pageList(sysMenu);
    }

    @ResultApi
    @ApiOperation("编辑前台菜单")
    @PreAuthorize("hasAuthority('sys:menu:editMenu')")
    @PostMapping("/editMenu")
    public void editMenu(@RequestBody SysMenu sysMenu){
        sysMenuService.editMenu(sysMenu);
    }

    @ResultApi
    @ApiOperation("新增前台菜单")
    @PreAuthorize("hasAuthority('sys:menu:addOne')")
    @PostMapping("/addOne")
    public void addOne(@RequestBody SysMenu sysMenu){
        sysMenuService.addOne(sysMenu);
    }

}
