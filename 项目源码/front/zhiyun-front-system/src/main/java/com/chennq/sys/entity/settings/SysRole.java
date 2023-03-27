package com.chennq.sys.entity.settings;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.chennq.sys.entity.PageDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/27 22:48
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@TableName("tf_sysrole")
public class SysRole  extends PageDto {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String name;
    @TableField("role_key")
    private String roleKey;
    private String status;
    @TableField("del_flag")
    private String delFlag;
    @TableField("create_by")
    private String createBy;
    @TableField("create_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @TableField("update_by")
    private String updateBy;
    @TableField("update_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    private String remark;
}
