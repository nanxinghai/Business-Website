package com.chennq.sys.entity.login;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/28 23:56
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
public class Permission implements Serializable,Cloneable{
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private Long pid;
    private String type;
    private String menuName;
    private String path;
    private String component;
    private String visible;
    private String status;
    private String perms;
    private String icon;
    private Long createBy;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private Long updateBy;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    @TableLogic
    private Integer delFlag;
    private String remark;
    // 不是数据库字段
    @TableField(exist = false)
    private List<Permission> children;
}
