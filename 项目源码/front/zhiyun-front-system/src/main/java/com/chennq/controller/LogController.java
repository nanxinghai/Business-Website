package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "前台联系我们模块对象功能接口")
@RestController
@RequestMapping("/log")
public class LogController {

    @ResultApi
    @ApiOperation("记录数据")
    @GetMapping("/insertData")
    public void insert(){}
}
