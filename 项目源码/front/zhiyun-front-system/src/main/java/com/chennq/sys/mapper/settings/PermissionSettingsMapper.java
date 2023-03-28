package com.chennq.sys.mapper.settings;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.settings.SysMenu;

public interface PermissionSettingsMapper extends BaseMapper<SysMenu> {
    void changeStatus(SysMenu sysMenu);
}
