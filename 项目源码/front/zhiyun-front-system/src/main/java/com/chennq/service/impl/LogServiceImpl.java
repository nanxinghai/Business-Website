package com.chennq.service.impl;

import com.chennq.entity.Log;
import com.chennq.mapper.LogMapper;
import com.chennq.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public void insert(Log log){
        logMapper.insert(log);
    }

}
