package com.chennq.sys.service.front;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysPhone;
import com.chennq.sys.entity.front.SysQrCode;

public interface SysFootService {
    PageVo<SysPhone> pageList(SysPhone sysPhone);

    void editSysPhone(SysPhone sysPhone);

    void addOne(SysPhone sysPhone);

    SysQrCode getOne();
}
