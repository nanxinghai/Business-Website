package com.chennq.sys.service.settings.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chennq.base.exception.MyException;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.settings.SysMenu;
import com.chennq.sys.mapper.settings.PermissionSettingsMapper;
import com.chennq.sys.service.settings.PermissionSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PermissionSettingsServiceImpl implements PermissionSettingsService {
    @Autowired
    private PermissionSettingsMapper permissionSettingsMapper;

    @Override
    public PageVo<SysMenu> pageListPer(SysMenu sysMenu) {
        long pageNum = sysMenu.getPageNum();
        long pageSize = sysMenu.getPageSize();
        QueryWrapper<SysMenu> sysMenuQueryWrapper = new QueryWrapper<>();
        // 匹配字段
        sysMenuQueryWrapper.like(StringUtils.hasText(sysMenu.getMenuName()),"menu_name",sysMenu.getMenuName())
                .like(StringUtils.hasText(sysMenu.getPath()),"path",sysMenu.getPath())
                .eq(StringUtils.hasText(sysMenu.getType()),"type",sysMenu.getType())
                .eq(StringUtils.hasText(sysMenu.getStatus()),"status",sysMenu.getStatus());
        List<SysMenu> sysMenus = permissionSettingsMapper.selectList(sysMenuQueryWrapper);
        // 扁平化数据转成父子级数据
        List<SysMenu> collect = sysMenus.stream()
                // 找出顶级数据
                .filter(o -> o.getPid() == null)
                // 给当前顶级的 childList 设置子级
                .peek( o -> o.setChildren(getChildList(o,sysMenus)))
                .collect(Collectors.toList());
        // 根据分页，提取数据
        PageVo<SysMenu> sysMenuPageVo = listToPage((int) pageNum, (int) pageSize, collect);
        return sysMenuPageVo;
    }

    @Override
    public void stopStatus(SysMenu sysMenu) {
        if(sysMenu.getId() == null){
            throw new MyException("修改成停用必须传递id");
        }
        sysMenu.setStatus("1");
        permissionSettingsMapper.changeStatus(sysMenu);
    }

    @Override
    public void returnStatus(SysMenu sysMenu) {
        if(sysMenu.getId() == null){
            throw new MyException("修改成恢复必须传递id");
        }
        sysMenu.setStatus("0");
        permissionSettingsMapper.changeStatus(sysMenu);
    }

    @Override
    public void addOnePer(SysMenu sysMenu) {
        permissionSettingsMapper.insert(sysMenu);
    }

    @Override
    public void editOnePer(SysMenu sysMenu) {
        permissionSettingsMapper.updateById(sysMenu);
    }


    // 根据当前父类 找出子类， 并通过递归找出子类的子类
    private List<SysMenu> getChildList(SysMenu sysMenu, List<SysMenu> list) {
        return list.stream()
                //筛选出父节点id == parentId 的所有对象 => list
                .filter(o -> sysMenu.getId().equals(o.getPid()))
                .peek(o -> o.setChildren(getChildList(o, list)))
                .collect(Collectors.toList());
    }

    /**
     * 处理List集合数据进行分页
     *
     * @param currentPage 当前页
     * @param pageSize    每页数据个数
     * @param list        进行分页的数据
     * @param <T>
     * @return
     */
    public static <T> PageVo<T> listToPage(int currentPage, int pageSize, List<T> list) {
        int total = list.size();
        if (total > pageSize) {
            int toIndex = pageSize * currentPage;
            if (toIndex > total) {
                toIndex = total;
            }
            list = list.subList(pageSize * (currentPage - 1), toIndex);
        }
        return new PageVo<T>(list,(long) total);
    }
}
