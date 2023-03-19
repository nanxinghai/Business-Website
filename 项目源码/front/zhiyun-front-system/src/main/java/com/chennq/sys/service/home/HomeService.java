package com.chennq.sys.service.home;

import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.home.Log;
import com.chennq.sys.entity.home.vo.PvUvVo;

import java.util.List;

public interface HomeService {
    PageVo<Log> getLogData(PageDto pageDto);

    PvUvVo getPUvData();
}
