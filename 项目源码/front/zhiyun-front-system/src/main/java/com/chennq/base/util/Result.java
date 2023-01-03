package com.chennq.base.util;

import com.chennq.base.enmu.ResultCode;
import lombok.Data;

import java.io.Serializable;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/4 19:47
 * @description：统一返回值
 * @modified By：
 * @version: v1.0
 */
@Data
public class Result implements Serializable {
    private Integer code;
    private String msg;
    private Object data;
    private Result(){}
    public static Result success(Object data){
        Result result = new Result();
        result.setCode(ResultCode.SUCCESS.code());
        result.setMsg(ResultCode.SUCCESS.msg());
        result.setData(data);
        return result;
    }
    public static Result failure(String message){
        Result result = new Result();
        result.setCode(ResultCode.FAILURE.code());
        result.setMsg(message);
        result.setData(null);
        return result;
    }
}
