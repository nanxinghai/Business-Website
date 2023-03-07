package com.chennq.sys.service.login;

import com.chennq.sys.entity.login.CodeLogin;
import com.chennq.sys.entity.login.LoginJwt;
import com.chennq.sys.entity.login.User;
import com.chennq.sys.entity.login.vo.WxCodeVo;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:44
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface LoginService {
    /**
     * 用户名登录
     * @param user
     * @return
     */
    LoginJwt login(User user);

    /**
     * 获取验证码
     * @param phone
     * @throws Exception
     */
    void getSmsCode(String phone) throws Exception;

    /**
     * 验证码登录
     * @param codeLogin
     * @return
     */
    LoginJwt codeLogin(CodeLogin codeLogin);

    /**
     * 微信扫码登录回调
     * @param code
     * @param state
     * @return
     */
    LoginJwt weChatCallBack(String code, String state) throws Exception;
}
