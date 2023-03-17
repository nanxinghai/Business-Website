package com.chennq.sys.entity.home;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Log {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String ip;
    private String addr;
    private String osName;
    private String browerName;
    private String content;
    private String type;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date reqTime;
}
