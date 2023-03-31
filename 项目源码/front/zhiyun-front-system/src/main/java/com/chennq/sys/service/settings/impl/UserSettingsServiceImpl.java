package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.base.exception.MyException;
import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.entity.settings.dto.ChangeUserRoleDto;
import com.chennq.sys.entity.settings.vo.SysRoleWithHasPer;
import com.chennq.sys.mapper.settings.RoleSettingsMapper;
import com.chennq.sys.mapper.settings.UserSettingsMapper;
import com.chennq.sys.service.settings.UserSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    private RoleSettingsMapper roleSettingsMapper;

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
        String password = sysUser.getPassword();
        String encodePassword = new BCryptPasswordEncoder().encode(password);
        sysUser.setPassword(encodePassword);
        userSettingsMapper.insert(sysUser);
    }

    @Override
    public SysRoleWithHasPer queryUserRole(SysUser sysUser) {
        // 查询所有角色
        List<SysRole> sysRoles = roleSettingsMapper.selectList(null);
        // 查询用户所拥有的角色
        List<SysRole> userHasRoles =  userSettingsMapper.queryRoleList(sysUser);
        List<Long> ids = new ArrayList<Long>();
        // 将用户所拥有的角色匹配全部角色，匹配到就将id插入到ids中
        ids = sysRoles.stream()
                .filter(userHasRoles::contains)
                .map(item -> item.getId())
                .collect(Collectors.toList());
        return new SysRoleWithHasPer(sysRoles,ids);
    }

    @Override
    public void changeUserRole(ChangeUserRoleDto changeUserRoleDto) {
        if(!StringUtils.hasText(changeUserRoleDto.getUserId())){
            throw new MyException("参数必须传递userId");
        }
        if(!StringUtils.hasText(changeUserRoleDto.getRoleId())){
            throw new MyException("参数必须传递roleId");
        }
        if(changeUserRoleDto.getIsChecked()){
            // 增加角色
            userSettingsMapper.addOneRole(changeUserRoleDto);
        }else{
            // 取消角色
            userSettingsMapper.deleteOneRole(changeUserRoleDto);
        }
    }
}
