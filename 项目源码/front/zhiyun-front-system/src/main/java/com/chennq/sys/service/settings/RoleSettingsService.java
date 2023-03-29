package com.chennq.sys.service.settings;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.entity.settings.SysRole;
import com.chennq.sys.entity.settings.vo.SysMenuWithHasPer;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 22:52
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface RoleSettingsService {
    PageVo<SysRole> pageListRole(SysRole sysRole);

    void forbbinStatus(SysRole sysRole);

    void returnStatus(SysRole sysRole);

    void addOneRole(SysRole sysRole);

    SysMenuWithHasPer queryRolePer(SysRole sysRole);
}
