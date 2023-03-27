package com.chennq.sys.entity.settings;

import com.baomidou.mybatisplus.annotation.*;
import com.chennq.sys.entity.PageDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/20 23:17
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@TableName("tf_sysuser")
public class SysUser extends PageDto {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    @TableField("user_name")
    private String userName;
    @TableField("nick_name")
    private String nickName;
    private String password;
    private String status;
    private String email;
    private String phonenumber;
    private String sex;
    private String avatar;
    @TableField("user_type")
    private String userType;
    @TableField("create_by")
    private Long createBy;
    @TableField("create_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @TableField("update_by")
    private Long updateBy;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("update_time")
    private Date updateTime;
    @TableLogic
    @TableField("del_flag")
    private Integer delFlag;
    private String openid;

}
