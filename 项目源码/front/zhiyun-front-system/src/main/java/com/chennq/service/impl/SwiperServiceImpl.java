package com.chennq.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chennq.entity.Swiper;
import com.chennq.mapper.SwiperMapper;
import com.chennq.service.SwiperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SwiperServiceImpl implements SwiperService {
    @Autowired
    private SwiperMapper swiperMapper;

    @Override
    public List<Swiper> getSwiperData() {
        QueryWrapper<Swiper> swiperQueryWrapper = new QueryWrapper<>();
        swiperQueryWrapper.orderByAsc("orderNum");
        List<Swiper> swipers = swiperMapper.selectList(swiperQueryWrapper);
        return swipers;
    }
}
