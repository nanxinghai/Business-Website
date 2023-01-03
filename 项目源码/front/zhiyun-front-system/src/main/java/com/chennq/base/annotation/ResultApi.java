package com.chennq.base.annotation;

import java.lang.annotation.*;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/5 22:09
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Target(ElementType.METHOD) // 该注解可以使用在方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ResultApi {
}
