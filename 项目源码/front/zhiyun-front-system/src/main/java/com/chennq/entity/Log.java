package com.chennq.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel(value = "前台日志表",description = "")
public class Log {
    /** 主键 */
    @TableId(value = "id",type = IdType.AUTO)
    @ApiModelProperty(name = "主键",notes = "")
    private Integer id ;
    /** ip */
    @ApiModelProperty(name = "ip",notes = "")
    private String ip ;
    /** 地址 */
    @ApiModelProperty(name = "地址",notes = "")
    private String addr ;
    /** 操作系统 */
    @ApiModelProperty(name = "操作系统",notes = "")
    private String osname ;
    /** 浏览器种类 */
    @ApiModelProperty(name = "浏览器种类",notes = "")
    private String browername ;
    /** 操作内容 */
    @ApiModelProperty(name = "操作内容",notes = "")
    private String content ;
    /** 操作类型;0：数据请求  1：菜单点击 */
    @ApiModelProperty(name = "操作类型",notes = "0：数据请求  1：菜单点击")
    private String type ;
    /** 请求时间 */
    @ApiModelProperty(name = "请求时间",notes = "")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date reqtime ;
}
