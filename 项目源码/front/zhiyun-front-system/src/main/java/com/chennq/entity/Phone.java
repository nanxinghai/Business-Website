package com.chennq.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel(value = "前台热线表",description = "")
public class Phone {
    /** 主键 */
    @TableId(value = "id",type = IdType.AUTO)
    @ApiModelProperty(name = "主键",notes = "")
    private Integer id ;
    /** 联系人名称 */
    @ApiModelProperty(name = "联系人名称",notes = "")
    private String phonename ;
    /** 联系人号码 */
    @ApiModelProperty(name = "联系人号码",notes = "")
    private String phonenum ;
    /** 是否展示;0：展示 1：不展示 */
    @ApiModelProperty(name = "是否展示",notes = "0：展示 1：不展示")
    @TableLogic
    private String isshow ;
    /** 上传人id */
    @ApiModelProperty(name = "上传人id",notes = "")
    private String createby ;
    /** 上传时间 */
    @ApiModelProperty(name = "上传时间",notes = "")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime ;
}
