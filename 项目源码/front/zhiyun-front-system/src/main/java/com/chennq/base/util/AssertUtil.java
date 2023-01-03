package com.chennq.base.util;

import com.chennq.base.exception.MyException;
import org.springframework.util.Assert;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 1:06
 * @description：
 * @modified By：
 * @version: v1.0
 */
public class AssertUtil extends Assert {
    /**
     * 示例
     * @param name
     * @param msg
     */
    public static void isNotBlank(String name,String msg){
        if(name == null || name.trim().equalsIgnoreCase("")){
            throw new MyException(msg);
        }
    }
}
