package com.chennq.sys.service;

import com.chennq.base.exception.MyException;
import com.chennq.sys.entity.login.LoginUser;
import com.chennq.sys.entity.login.Permission;
import com.chennq.sys.entity.login.User;
import com.chennq.sys.mapper.login.PermissionMapper;
import com.chennq.sys.mapper.login.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/28 21:49
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * SpringSecurity内置方法重写
     * @param phoneNum 用户手机号或者邮箱
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String phoneNum) throws UsernameNotFoundException {
        // 1、根据手机号或者邮箱
        User userFromDB = userMapper.getUserByUserNameOrEmail(phoneNum);
        // 没有该用户
        if(Objects.isNull(userFromDB)){
            throw new MyException("用户不存在!!!");
        }
        LoginUser loginUserByUser = getLoginUserByUser(userFromDB);
        return loginUserByUser;
    }

    public LoginUser getLoginUserByUser(User userFromDB){
        String userId = userFromDB.getId().toString();
        // 2、查询用户权限信息
        // 这是权限标识字符串
//        List<String> permissions = permissionMapper.getUserPermByUserId(userId);
        // TODO 由于数据库暂时无权限数据，先写死
        List<String> permissions = Arrays.asList("sys:home");
        // 这是所有权限(扁平化数据)
        List<Permission> allPermission = permissionMapper.getAllPermission(userId);
        // 扁平化数据转成父子级数据
        List<Permission> collect = allPermission.stream()
                // 找出顶级数据
                .filter(o -> o.getPid() == null)
                // 给当前顶级的 childList 设置子级
                .peek( o -> o.setChildren(getChildList(o,allPermission)))
                .collect(Collectors.toList());
        // 权限信息组装成父子结构
        LoginUser loginUser = new LoginUser(userFromDB,collect,permissions);
        return loginUser;
    }

    // 根据当前父类 找出子类， 并通过递归找出子类的子类
    private List<Permission> getChildList(Permission permission, List<Permission> list) {
        return list.stream()
                //筛选出父节点id == parentId 的所有对象 => list
                .filter(o -> permission.getId().equals(o.getPid()))
                .peek(o -> o.setChildren(getChildList(o, list)))
                .collect(Collectors.toList());
    }
}
