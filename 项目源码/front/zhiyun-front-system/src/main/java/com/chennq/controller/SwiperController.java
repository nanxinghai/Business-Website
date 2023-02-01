package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Swiper;
import com.chennq.service.SwiperService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "轮播图接口")
@RestController
@RequestMapping("/swiper")
public class SwiperController {
    @Autowired
    private SwiperService swiperService;

    @ResultApi
    @ApiOperation("查询已启用数据")
    @GetMapping("/getSwiperData")
    public List<Swiper> getSwiperData(){
        return swiperService.getSwiperData();
    }
}
