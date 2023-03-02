package com.chennq.sys.entity.login;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:46
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
public class User implements Serializable,Cloneable{
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String userName;
    private String nickName;
    private String password;
    private String status;
    private String email;
    private String phonenumber;
    private String sex;
    private String avatar;
    private String user_type;
    private Long create_by;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date create_time;
    private Long update_by;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date update_time;
    @TableLogic
    private Integer del_flag;
}
