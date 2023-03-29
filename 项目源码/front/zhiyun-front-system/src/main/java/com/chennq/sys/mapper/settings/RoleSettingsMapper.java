package com.chennq.sys.mapper.settings;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.entity.settings.SysRole;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 22:54
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface RoleSettingsMapper extends BaseMapper<SysRole> {
    List<SysMenu> queryRolePer(SysRole sysRole);
}
