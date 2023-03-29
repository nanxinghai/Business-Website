package com.chennq.sys.entity.settings;

import com.baomidou.mybatisplus.annotation.*;
import com.chennq.sys.entity.PageDto;
import com.chennq.sys.entity.login.Permission;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@TableName("tf_sysmenu")
public class SysMenu extends PageDto {
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
    private List<SysMenu> children;
    @TableField(exist = false)
    private Boolean hasPermission;
}
