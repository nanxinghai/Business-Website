package com.chennq.sys.controller.home;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.home.Log;
import com.chennq.sys.entity.home.vo.PvUvVo;
import com.chennq.sys.service.home.HomeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "后台首页数据功能接口")
@RestController
@RequestMapping("/sys/home")
public class HomeController {
    @Autowired
    private HomeService homeService;

    @ResultApi
    @ApiOperation("获取PV、UV数据接口")
    @PostMapping("/getPUvData")
    public PvUvVo getPUvData(){
        return null;
    }

    @ResultApi
    @ApiOperation("获取用户点击日志数据接口")
    @PreAuthorize("hasAuthority('sys:home:getLogData')")
    @PostMapping("/getLogData")
    public List<Log> getLogData(){
        return homeService.getLogData();
    }


}
