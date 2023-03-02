package com.chennq.sys.service.login;

import com.chennq.sys.entity.login.LoginJwt;
import com.chennq.sys.entity.login.User;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:44
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface LoginService {
    LoginJwt login(User user);
}
