package com.chennq.sys.service.settings;

import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysUser;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 21:28
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface UserSettingsService {
    PageVo<SysUser> pageListUser(SysUser sysUser);
}
