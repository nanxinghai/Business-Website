package com.chennq.sys.entity.home.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PvUvVo {
    private Integer todayPV;
    private Integer totalPV;
    private Integer PVScale;
    private Integer todayUV;
    private Integer totalUV;
    private Integer UVScale;
}
