package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.mapper.settings.PermissionSettingsMapper;
import com.chennq.sys.mapper.settings.RoleSettingsMapper;
import com.chennq.sys.service.settings.RoleSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

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
    private PermissionSettingsMapper permissionSettingsMapper;

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

    @Override
    public void forbbinStatus(SysRole sysRole) {
        sysRole.setStatus("1");
        roleSettingsMapper.updateById(sysRole);
    }

    @Override
    public void returnStatus(SysRole sysRole) {
        sysRole.setStatus("0");
        roleSettingsMapper.updateById(sysRole);
    }

    @Override
    public void addOneRole(SysRole sysRole) {
        roleSettingsMapper.insert(sysRole);
    }

    @Override
    public List<SysMenu> queryRolePer(SysRole sysRole) {
        // 查询所有权限
        List<SysMenu> sysMenus = permissionSettingsMapper.selectList(null);
        // 查询用户拥有权限
        List<SysMenu> rolePermissions =  roleSettingsMapper.queryRolePer(sysRole);

        return null;
    }
}
