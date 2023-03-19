package com.chennq.sys.mapper.home;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.home.Log;
import com.chennq.sys.entity.home.vo.PvUvVo;

public interface HomeMapper extends BaseMapper<Log> {
    PvUvVo selectPv();
}
