package com.chennq.sys.mapper.login;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.login.Permission;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/1 0:05
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    // 获取用户所有权限标识
    List<String> getUserPermByUserId(String userId);
    // 获取用户所有权限信息
    List<Permission> getAllPermission(String userId);
}
