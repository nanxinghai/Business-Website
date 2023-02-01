package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.vo.FootVo;
import com.chennq.service.FootService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "公共底部功能接口")
@RestController
@RequestMapping("/foot")
public class FootController {
    @Autowired
    private FootService footService;

    @ResultApi
    @ApiOperation("查询已启用数据")
    @GetMapping("/getFootData")
    public FootVo getFootData(){
        return footService.getFootData();
    }
}
