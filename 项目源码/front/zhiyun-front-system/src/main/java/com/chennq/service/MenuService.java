package com.chennq.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chennq.entity.Menu;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:12
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface MenuService extends IService<Menu> {
    List<Menu> getMenuData(Object o);
}
