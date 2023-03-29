package com.chennq.sys.entity.settings.vo;

import com.chennq.sys.entity.settings.SysMenu;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/29 22:51
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysMenuWithHasPer {
    private List<SysMenu> sysMenus;
    private List<Long> ids;
}
