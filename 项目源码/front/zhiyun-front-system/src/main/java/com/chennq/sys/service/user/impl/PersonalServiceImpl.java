package com.chennq.sys.service.user.impl;

import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.mapper.user.PersonalMapper;
import com.chennq.sys.service.user.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalServiceImpl implements PersonalService {
    @Autowired
    private PersonalMapper personalMapper;

    @Override
    public SysUser getPersonInfo(SysUser sysUser) {
        SysUser sysUser1 = personalMapper.selectById(sysUser.getCreateBy());
        sysUser1.setPassword(null);
        return sysUser1;
    }

    @Override
    public void editUser(SysUser sysUser) {
        personalMapper.updateById(sysUser);
    }
}
