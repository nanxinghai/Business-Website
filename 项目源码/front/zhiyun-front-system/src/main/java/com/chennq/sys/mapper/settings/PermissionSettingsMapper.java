package com.chennq.sys.mapper.settings;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.settings.SysMenu;

import java.util.List;

public interface PermissionSettingsMapper extends BaseMapper<SysMenu> {
    /**
     * 根据id找出本身及所有子级，并将状态更改
     * @param sysMenu
     */
    void changeStatus(SysMenu sysMenu);

    /**
     * 根据id找出本身及所有子级
     * @return
     */
    List<SysMenu> selectAllSonById(Long id);
}
