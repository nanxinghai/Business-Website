package com.chennq.sys.util;

import java.util.Random;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/3 22:17
 * @description：随机生成六位验证码工具类
 * @modified By：
 * @version: v1.0
 */
public class VerificationCodeUtil {
    public static String VerificationCode(){
//        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        String str="0123456789";
        int codeLength=6;
        StringBuilder sb=new StringBuilder(6);
        for(int i=0;i<codeLength;i++)
        {
            char ch=str.charAt(new Random().nextInt(str.length()));
            sb.append(ch);
        }
        return (sb.toString());
    }
}
