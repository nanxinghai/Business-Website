package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Demand;
import com.chennq.service.DemandService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/1 22:57
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "需求功能接口")
@RestController
@RequestMapping("/contact")
public class DemandController {
    @Autowired
    private DemandService demandService;

    @ResultApi
    @ApiOperation("添加需求")
    @PostMapping("/add")
    public void add(@RequestBody Demand demand){
        demandService.add(demand);
    }

}
