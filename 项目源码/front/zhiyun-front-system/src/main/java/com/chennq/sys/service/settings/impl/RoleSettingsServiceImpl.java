package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.mapper.settings.RoleSettingsMapper;
import com.chennq.sys.service.settings.RoleSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 22:53
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class RoleSettingsServiceImpl implements RoleSettingsService {
    @Autowired
    private RoleSettingsMapper roleSettingsMapper;

    @Override
    public PageVo<SysRole> pageListRole(SysRole sysRole) {
        QueryWrapper<SysRole> sysRoleQueryWrapper = new QueryWrapper<>();
        sysRoleQueryWrapper.like(StringUtils.hasText(sysRole.getName()),"name",sysRole.getName())
                .like(StringUtils.hasText(sysRole.getRoleKey()),"role_key",sysRole.getRoleKey())
                .eq(StringUtils.hasText(sysRole.getStatus()),"status",sysRole.getStatus());
        Page<SysRole> sysRolePage = roleSettingsMapper.selectPage(new Page<>(sysRole.getPageNum(), sysRole.getPageSize()), sysRoleQueryWrapper);
        return new PageVo<>(sysRolePage.getRecords(),sysRolePage.getTotal());
    }
}
