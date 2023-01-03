package com.chennq.base.enmu;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/4 22:55
 * @description：
 * @modified By：
 * @version: v1.0
 */
public enum ResultCode {
    SUCCESS(0,"成功"),
    FAILURE(-1,"失败");

    private Integer code;
    private String msg;

    ResultCode(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }
    public Integer code(){
        return this.code;
    }
    public String msg(){
        return this.msg;
    }
}
