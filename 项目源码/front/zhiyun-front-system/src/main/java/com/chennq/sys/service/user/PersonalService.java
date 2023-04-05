package com.chennq.sys.service.user;

import com.chennq.sys.entity.settings.SysUser;

public interface PersonalService {
    SysUser getPersonInfo(SysUser sysUser);

    void editUser(SysUser sysUser);

    void editAvator(SysUser sysUser);
}
