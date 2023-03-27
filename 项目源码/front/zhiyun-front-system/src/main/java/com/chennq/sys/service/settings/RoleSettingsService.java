package com.chennq.sys.service.settings;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysRole;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 22:52
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface RoleSettingsService {
    PageVo<SysRole> pageListRole(SysRole sysRole);
}
