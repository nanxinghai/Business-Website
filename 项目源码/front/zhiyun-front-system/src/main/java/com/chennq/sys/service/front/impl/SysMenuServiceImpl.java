package com.chennq.sys.service.front.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysMenu;
import com.chennq.sys.mapper.front.SysMenuMapper;
import com.chennq.sys.service.front.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * @author ：Simon
 * @date ：Created in 2023/4/5 23:32
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public PageVo<SysMenu> pageList(SysMenu sysMenu) {
        QueryWrapper<SysMenu> sysMenuQueryWrapper = new QueryWrapper<>();
        sysMenuQueryWrapper.like(StringUtils.hasText(sysMenu.getMenuname()),"menuName",sysMenu.getMenuname())
                .like(StringUtils.hasText(sysMenu.getMenucode()),"menuCode",sysMenu.getMenucode())
                .eq(sysMenu.getIsshow() != null,"isShow",sysMenu.getIsshow());
        Page<SysMenu> sysMenuPage = sysMenuMapper.selectPage(new Page<>(sysMenu.getPageNum(), sysMenu.getPageSize()), sysMenuQueryWrapper);
        return new PageVo<>(sysMenuPage.getRecords(),sysMenuPage.getTotal());
    }

    @Override
    public void editMenu(SysMenu sysMenu) {
        sysMenuMapper.updateById(sysMenu);
    }


}
