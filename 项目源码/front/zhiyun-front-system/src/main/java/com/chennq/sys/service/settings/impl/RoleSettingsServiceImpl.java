package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.entity.settings.vo.SysMenuWithHasPer;
import com.chennq.sys.mapper.settings.PermissionSettingsMapper;
import com.chennq.sys.mapper.settings.RoleSettingsMapper;
import com.chennq.sys.service.settings.RoleSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
    public SysMenuWithHasPer queryRolePer(SysRole sysRole) {
        // 查询所有权限
        List<SysMenu> sysMenus = permissionSettingsMapper.selectList(null);
        // 查询用户拥有权限
        List<SysMenu> rolePermissions =  roleSettingsMapper.queryRolePer(sysRole);
        // 修改权限属性hasPermission，如果存在就设置true
        sysMenus.stream()
                .filter(rolePermissions::contains)
                .forEach(item -> item.setHasPermission(true));
        // 将数组中含有hasPermission==true的值添加到ids中
        List<Long> ids = new ArrayList<Long>();
        ids = sysMenus.stream()
                .filter(item -> !Objects.isNull(item.getHasPermission()))
                .map(item -> item.getId())
                .collect(Collectors.toList());

        // 扁平化数据转成父子级数据
        List<SysMenu> collect = sysMenus.stream()
                // 找出顶级数据
                .filter(o -> o.getPid() == null)
                // 给当前顶级的 childList 设置子级
                .peek( o -> o.setChildren(getChildList(o,sysMenus)))
                .collect(Collectors.toList());

        return new SysMenuWithHasPer(collect,ids);
    }

    // 根据当前父类 找出子类， 并通过递归找出子类的子类
    private List<SysMenu> getChildList(SysMenu sysMenu, List<SysMenu> list) {
        return list.stream()
                //筛选出父节点id == parentId 的所有对象 => list
                .filter(o -> sysMenu.getId().equals(o.getPid()))
                .peek(o -> o.setChildren(getChildList(o, list)))
                .collect(Collectors.toList());
    }
}
