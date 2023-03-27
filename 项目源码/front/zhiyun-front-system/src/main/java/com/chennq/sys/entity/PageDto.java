package com.chennq.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/19 22:55
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
public class PageDto {
    @TableField(exist = false)
    private Long pageNum;
    @TableField(exist = false)
    private Long pageSize;
}
