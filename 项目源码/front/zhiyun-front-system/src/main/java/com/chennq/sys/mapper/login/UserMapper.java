package com.chennq.sys.mapper.login;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chennq.sys.entity.login.User;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/28 22:01
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface UserMapper extends BaseMapper<User> {
    User getUserByUserNameOrEmail(String phoneNum);

    User getUserByOpenid(String openid);
}
