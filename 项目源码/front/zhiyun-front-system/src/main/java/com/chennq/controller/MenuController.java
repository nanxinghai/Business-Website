package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Menu;
import com.chennq.service.MenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:14
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "前台菜单对象功能接口")
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @ResultApi
    @ApiOperation("获取前台菜单数据")
    @GetMapping("/getMenuData")
    public List<Menu> getMenuData(){
        List<Menu> list = menuService.getMenuData(null);
        return list;
    }
}
