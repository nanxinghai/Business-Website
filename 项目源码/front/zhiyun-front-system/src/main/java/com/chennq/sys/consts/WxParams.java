package com.chennq.sys.consts;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.chennq.sys.entity.login.WxAccessToken;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/4 23:54
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Component
@Data
public class WxParams {
    @Value("${wx.appid}")
    private String appid;
    @Value("${wx.secret}")
    private String secret;
    @Value("${wx.get_accessToken_url}")
    private String get_accessToken_url;

    public WxAccessToken getAccessToken(String code){
        String requestUrl = get_accessToken_url.replace("APPID",appid)
                .replace("SECRET",secret).replace("CODE",code);
        String result = HttpUtil.get(requestUrl);
        System.out.println(result);
        WxAccessToken wxAccessToken = JSON.parseObject(result, WxAccessToken.class);
        return wxAccessToken;
    }


}
