package com.chennq.base.exception;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/6 0:21
 * @description：
 * @modified By：
 * @version: v1.0
 */
public class MyException extends RuntimeException {

    private String message;

    public MyException(String message){
        super(message);
        this.message = message;
    }
}
