package com.chennq.sys.controller.demand;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.demand.Demand;
import com.chennq.sys.service.demand.SysDemandService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "后台需求列表功能接口")
@RestController
@RequestMapping("/sys/demand")
public class SysDemandController {

    @Autowired
    private SysDemandService demandService;

    @ResultApi
    @ApiOperation("查询需求列表，分页")
    @PreAuthorize("hasAuthority('sys:demand:pageList')")
    @PostMapping("/pageList")
    public PageVo<Demand> pageList(@RequestBody Demand demand){
        return demandService.pageList(demand);
    }

    @ResultApi
    @ApiOperation("更改需求状态")
    @PreAuthorize("hasAuthority('sys:demand:updateIsRelation')")
    @PostMapping("/updateIsRelation")
    public void updateIsRelation(@RequestBody Demand demand){
        demandService.updateIsRelation(demand);
    }
}
