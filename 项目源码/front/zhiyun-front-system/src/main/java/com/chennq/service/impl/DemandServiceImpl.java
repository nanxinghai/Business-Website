package com.chennq.service.impl;

import com.chennq.entity.Demand;
import com.chennq.mapper.DemandMapper;
import com.chennq.service.DemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/1 23:07
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class DemandServiceImpl implements DemandService {
    @Autowired
    private DemandMapper demandMapper;

    @Override
    public void add(Demand demand) {
        demandMapper.insert(demand);
    }
}
