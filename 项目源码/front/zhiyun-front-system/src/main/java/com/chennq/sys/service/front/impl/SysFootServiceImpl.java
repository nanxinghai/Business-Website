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

@Service
public class SysFootServiceImpl implements SysFootService {
    @Autowired
    private SysPhoneMapper sysPhoneMapper;
    @Autowired
    private SysQrCodeMapper sysQrCodeMapper;

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


}
