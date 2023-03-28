package com.chennq.sys.service.settings;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;

public interface PermissionSettingsService {
    PageVo<SysMenu> pageListPer(SysMenu sysMenu);

    void stopStatus(SysMenu sysMenu);

    void returnStatus(SysMenu sysMenu);

    void addOnePer(SysMenu sysMenu);

    void editOnePer(SysMenu sysMenu);
}
