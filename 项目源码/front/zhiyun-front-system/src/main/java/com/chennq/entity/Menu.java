package com.chennq.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:05
 * @description：
 * @modified By：
 * @version: v1.0
 */
@ApiModel(value = "前台菜单表",description = "")
@Data
public class Menu implements Serializable,Cloneable{
    /** 主键 */
    @ApiModelProperty(name = "主键",notes = "")
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id ;
    /** 菜单名字 */
    @ApiModelProperty(name = "菜单名字",notes = "")
    private String menuname ;
    /** 菜单代码 */
    @ApiModelProperty(name = "菜单代码",notes = "")
    private String menucode ;
    /** 排序 */
    @ApiModelProperty(name = "排序",notes = "")
    private Integer ordernum ;
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
