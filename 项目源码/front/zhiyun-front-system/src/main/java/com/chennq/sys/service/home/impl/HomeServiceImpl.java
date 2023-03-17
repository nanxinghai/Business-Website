package com.chennq.sys.service.home.impl;

import com.chennq.sys.entity.home.Log;
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
    public List<Log> getLogData() {
        List<Log> logs = homeMapper.selectList(null);
        return logs;
    }
}
