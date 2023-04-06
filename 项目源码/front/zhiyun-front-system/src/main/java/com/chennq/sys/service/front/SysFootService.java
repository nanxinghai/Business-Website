package com.chennq.sys.service.front;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysPhone;
import com.chennq.sys.entity.front.SysQrCode;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface SysFootService {
    PageVo<SysPhone> pageList(SysPhone sysPhone);

    void editSysPhone(SysPhone sysPhone);

    void addOne(SysPhone sysPhone);

    SysQrCode getOne();

    void uploadQrcode(MultipartFile file, HttpServletRequest request);
}
