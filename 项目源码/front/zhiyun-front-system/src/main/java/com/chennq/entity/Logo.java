package com.chennq.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:26
 * @description：
 * @modified By：
 * @version: v1.0
 */
@ApiModel(value = "前台logo表",description = "")
@Data
public class Logo implements Serializable,Cloneable{
    /** 主键 */
    @ApiModelProperty(name = "主键",notes = "")
    private Integer id ;
    /** 图片描述 */
    @ApiModelProperty(name = "图片描述",notes = "")
    private String des ;
    /** 图片路径 */
    @ApiModelProperty(name = "图片路径",notes = "")
    private String path ;
    /** 是否展示;0：展示  1：不展示 */
    @ApiModelProperty(name = "是否展示",notes = "0：展示  1：不展示")
    @TableLogic
    private Integer isshow ;
    /** 上传人id */
    @ApiModelProperty(name = "上传人id",notes = "")
    private String createby ;
    /** 上传时间 */
    @ApiModelProperty(name = "上传时间",notes = "")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime ;
}
