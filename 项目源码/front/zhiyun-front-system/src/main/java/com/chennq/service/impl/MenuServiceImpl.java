package com.chennq.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chennq.entity.Menu;
import com.chennq.mapper.MenuMapper;
import com.chennq.service.MenuService;
import org.springframework.stereotype.Service;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:13
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {
}
