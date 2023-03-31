package com.chennq.sys.mapper.settings;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.entity.settings.SysUser;
import com.chennq.sys.entity.settings.dto.ChangeUserRoleDto;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 21:32
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface UserSettingsMapper extends BaseMapper<SysUser> {
    List<SysRole> queryRoleList(SysUser sysUser);

    void addOneRole(ChangeUserRoleDto changeUserRoleDto);

    void deleteOneRole(ChangeUserRoleDto changeUserRoleDto);
}
