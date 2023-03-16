package com.chennq.sys.controller.home;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.home.vo.PvUvVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "后台首页数据功能接口")
@RestController
@RequestMapping("/sys")
public class HomeController {

    @ResultApi
    @ApiOperation("获取PV、UV数据接口")
    @PostMapping("/getPUvData")
    public PvUvVo getPUvData(){
        return null;
    }
}
