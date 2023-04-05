package com.chennq.sys.service.demand.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.demand.Demand;
import com.chennq.sys.mapper.demand.SysDemandMapper;
import com.chennq.sys.service.demand.SysDemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * @author ：Simon
 * @date ：Created in 2023/4/5 22:09
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class SysDemandServiceImpl implements SysDemandService {
    @Autowired
    private SysDemandMapper demandMapper;

    @Override
    public PageVo<Demand> pageList(Demand demand) {
        QueryWrapper<Demand> demandQueryWrapper = new QueryWrapper<>();
        demandQueryWrapper.like(StringUtils.hasText(demand.getName()),"name",demand.getName())
                .like(StringUtils.hasText(demand.getPhone()),"phone",demand.getPhone())
                .like(StringUtils.hasText(demand.getEmail()),"email",demand.getEmail())
                .eq(StringUtils.hasText(demand.getIsRelation()),"isRelation",demand.getIsRelation());
        Page<Demand> demandPage = demandMapper.selectPage(new Page<>(demand.getPageNum(), demand.getPageSize()), demandQueryWrapper);
        return new PageVo<>(demandPage.getRecords(),demandPage.getTotal());
    }

    @Override
    public void updateIsRelation(Demand demand) {
        demand.setIsRelation("1");
        demandMapper.updateById(demand);
    }
}
