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
@ApiModel(value = "前台轮播图",description = "")
public class Swiper {
    /** 主键 */
    @TableId(value = "id",type = IdType.AUTO)
    @ApiModelProperty(name = "主键",notes = "")
    private Integer id ;
    /** 显示次序 */
    @ApiModelProperty(name = "显示次序",notes = "")
    private Integer ordernum ;
    /** 图片描述 */
    @ApiModelProperty(name = "图片描述",notes = "")
    private String desr ;
    /** 图片路径 */
    @ApiModelProperty(name = "图片路径",notes = "")
    private String path ;
    /** 是否展示;0：展示  1：不展示 */
    @ApiModelProperty(name = "是否展示",notes = "0：展示  1：不展示")
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
