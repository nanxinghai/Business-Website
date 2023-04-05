package com.chennq.sys.entity.demand;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.chennq.sys.entity.PageDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/1 22:55
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@TableName("tf_demand")
public class Demand extends PageDto {
    /** 主键 */
    @TableId(value = "id",type = IdType.AUTO)
    @ApiModelProperty(name = "主键",notes = "")
    private Long id ;
    /** 客户姓名 */
    @ApiModelProperty(name = "客户姓名",notes = "")
    private String name ;
    /** 客户地址 */
    @ApiModelProperty(name = "客户地址",notes = "")
    private String addr ;
    /** 客户手机 */
    @ApiModelProperty(name = "客户手机",notes = "")
    private String phone ;
    /** 客户邮箱 */
    @ApiModelProperty(name = "客户邮箱",notes = "")
    private String email ;
    /** 客户需求描述 */
    @ApiModelProperty(name = "客户需求描述",notes = "")
    private String demand ;
    /** 上传时间 */
    @ApiModelProperty(name = "上传时间",notes = "")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime ;
    @TableField("isRelation")
    private String isRelation;
}
