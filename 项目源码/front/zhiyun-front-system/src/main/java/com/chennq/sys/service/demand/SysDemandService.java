package com.chennq.sys.service.demand;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.demand.Demand;

/**
 * @author ：Simon
 * @date ：Created in 2023/4/5 22:09
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface SysDemandService {
    PageVo<Demand> pageList(Demand demand);

    void updateIsRelation(Demand demand);
}
