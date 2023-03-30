package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.mapper.settings.UserSettingsMapper;
import com.chennq.sys.service.settings.UserSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 21:29
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class UserSettingsServiceImpl implements UserSettingsService {
    @Autowired
    private UserSettingsMapper userSettingsMapper;

    @Override
    public PageVo<SysUser> pageListUser(SysUser sysUser) {
        QueryWrapper<SysUser> sysUserQueryWrapper = new QueryWrapper<>();
        sysUserQueryWrapper.like(StringUtils.hasText(sysUser.getNickName()),"nick_name",sysUser.getNickName())
                .like(StringUtils.hasText(sysUser.getPhonenumber()),"phonenumber",sysUser.getPhonenumber())
                .eq(StringUtils.hasText(sysUser.getSex()),"sex",sysUser.getSex());
        Page<SysUser> sysUserPage = userSettingsMapper.selectPage(new Page<>(sysUser.getPageNum(), sysUser.getPageSize()), sysUserQueryWrapper);
        return new PageVo<>(sysUserPage.getRecords(),sysUserPage.getTotal());
    }

    @Override
    public void addOneUser(SysUser sysUser) {
        userSettingsMapper.insert(sysUser);
    }
}
