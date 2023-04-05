package com.chennq.sys.service.front;

import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysMenu;

/**
 * @author ：Simon
 * @date ：Created in 2023/4/5 23:32
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface SysMenuService {
    PageVo<SysMenu> pageList(SysMenu sysMenu);

    void editMenu(SysMenu sysMenu);
}
