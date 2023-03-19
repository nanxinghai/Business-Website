package com.chennq.sys.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/18 1:14
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageVo<R> {
    private List<R> data;
    private Long total;
}
