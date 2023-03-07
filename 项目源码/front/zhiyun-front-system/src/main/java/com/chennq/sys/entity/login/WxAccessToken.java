package com.chennq.sys.entity.login;

import lombok.Data;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/5 22:01
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
public class WxAccessToken {
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private String openid;
    private String scope;
    private String unionid;
}
