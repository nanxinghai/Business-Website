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
@ApiModel(value = "前台公司二维码表",description = "")
public class Qrcode {
    /** 主键 */
    @TableId(value = "id",type = IdType.AUTO)
    @ApiModelProperty(name = "主键",notes = "")
    private Integer id ;
    /** 二维码描述 */
    @ApiModelProperty(name = "二维码描述",notes = "")
    private String descr ;
    /** 二维码图片地址 */
    @ApiModelProperty(name = "二维码图片地址",notes = "")
    private String path ;
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
