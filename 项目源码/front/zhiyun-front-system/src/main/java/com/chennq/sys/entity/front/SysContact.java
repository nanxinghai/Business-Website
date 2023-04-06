package com.chennq.sys.entity.front;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel(value = "联系我们",description = "")
@TableName("tf_contact")
public class SysContact {
    /** 主键 */
    @ApiModelProperty(name = "主键",notes = "")
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id ;
    /** qq号 */
    @ApiModelProperty(name = "qq号",notes = "")
    private String qqnum ;
    /** 手机号 */
    @ApiModelProperty(name = "手机号",notes = "")
    private String phonenum ;
    /** 邮箱 */
    @ApiModelProperty(name = "邮箱",notes = "")
    private String emailnum ;
    /** 地址 */
    @ApiModelProperty(name = "地址",notes = "")
    private String address ;
    /** 隐私保护协议文件地址 */
    @ApiModelProperty(name = "隐私保护协议文件地址",notes = "")
    private String path ;
    /** 上传人id */
    @ApiModelProperty(name = "上传人id",notes = "")
    private String createby ;
    /** 上传时间 */
    @ApiModelProperty(name = "上传时间",notes = "")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime ;
    /** 是否启用;0：启用 1：不启用 */
    @ApiModelProperty(name = "是否启用",notes = "0：启用 1：不启用")
    @TableLogic
    private Integer isdeleted ;
}
