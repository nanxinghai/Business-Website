package com.chennq.sys.config;

import com.chennq.sys.mapper.init.InitMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/2 21:18
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Slf4j
@Component
public class InitDataSource {
    @Autowired
    private InitMapper initMapper;

    @PostConstruct
    public void init(){
        log.info("初始化hikari连接池");
        // 初始化hikari连接池
        initMapper.Init();
    }
}
