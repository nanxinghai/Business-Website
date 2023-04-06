package com.chennq.sys.service.front.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysPhone;
import com.chennq.sys.entity.front.SysQrCode;
import com.chennq.sys.mapper.front.SysPhoneMapper;
import com.chennq.sys.mapper.front.SysQrCodeMapper;
import com.chennq.sys.service.front.SysFootService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

@Service
public class SysFootServiceImpl implements SysFootService {
    @Autowired
    private SysPhoneMapper sysPhoneMapper;
    @Autowired
    private SysQrCodeMapper sysQrCodeMapper;

    @Autowired
    private ServletContext servletContext;
    @Override
    public PageVo<SysPhone> pageList(SysPhone sysPhone) {
        QueryWrapper<SysPhone> sysPhoneQueryWrapper = new QueryWrapper<>();
        sysPhoneQueryWrapper.like(StringUtils.hasText(sysPhone.getPhonename()),"phoneName",sysPhone.getPhonename())
                .like(StringUtils.hasText(sysPhone.getPhonenum()),"phoneNum",sysPhone.getPhonenum())
                .eq(StringUtils.hasText(sysPhone.getIsshow()),"isShow",sysPhone.getIsshow());
        Page<SysPhone> sysPhonePage = sysPhoneMapper.selectPage(new Page<>(sysPhone.getPageNum(), sysPhone.getPageSize()), sysPhoneQueryWrapper);
        return new PageVo<>(sysPhonePage.getRecords(),sysPhonePage.getTotal());
    }

    @Override
    public void editSysPhone(SysPhone sysPhone) {
        sysPhoneMapper.updateById(sysPhone);
    }

    @Override
    public void addOne(SysPhone sysPhone) {
        sysPhoneMapper.insert(sysPhone);
    }

    @Override
    public SysQrCode getOne() {
        return sysQrCodeMapper.selectOne(null);
    }

    @Override
    public void uploadQrcode(MultipartFile file, HttpServletRequest request) {
        String a = request.getRequestURL().toString();
        // 地址，例如：http://localhost:8888
        String baseUrl = "";
        int port = request.getServerPort();
        try {
            URL url = new URL(a);
            baseUrl = url.getProtocol() + "://" + url.getHost() + ":" + url.getPort();
            System.out.println(baseUrl);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        // 上传文件名
        String fileName = file.getOriginalFilename();
        String currentDir = System.getProperty("user.dir");
        String substring = currentDir + "\\src\\main\\resources\\static";
        File dest = new File(substring + "\\" +fileName);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = baseUrl + "/" + fileName;
        SysQrCode sysQrCode = new SysQrCode();
        sysQrCode.setPath(path);
        sysQrCode.setId(Integer.valueOf(request.getParameter("id")));
        sysQrCodeMapper.updateById(sysQrCode);
    }


}
