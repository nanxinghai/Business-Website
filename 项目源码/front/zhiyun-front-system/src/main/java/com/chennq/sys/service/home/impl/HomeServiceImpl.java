package com.chennq.sys.service.home.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.home.Log;
import com.chennq.sys.entity.home.vo.PvUvVo;
import com.chennq.sys.mapper.home.HomeMapper;
import com.chennq.sys.service.home.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private HomeMapper homeMapper;

    @Override
    public PageVo<Log> getLogData(PageDto pageDto) {
        QueryWrapper<Log> logQueryWrapper = new QueryWrapper<>();
        logQueryWrapper.orderByDesc("reqTime");
        Page<Log> logPage = homeMapper.selectPage(new Page<>(pageDto.getPageNum(),pageDto.getPageSize()), logQueryWrapper);
        List<Log> logs = logPage.getRecords();
        return new PageVo<>(logs,logPage.getTotal());
    }

    @Override
    public PvUvVo getPUvData() {
        PvUvVo pvUvVo = homeMapper.selectPv();
        return pvUvVo;
    }
}
