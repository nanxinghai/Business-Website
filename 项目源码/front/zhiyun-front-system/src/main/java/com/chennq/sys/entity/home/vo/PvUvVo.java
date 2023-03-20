package com.chennq.sys.entity.home.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PvUvVo {
    private Integer todayPV;
    private Integer totalPV;
    private Double PVScale;
    private Integer todayUV;
    private Integer totalUV;
    private Double UVScale;


    public void setPVScale(Double PVScale) {
        BigDecimal bigDecimal = new BigDecimal(PVScale);
        double v = bigDecimal.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
        this.PVScale = v;
    }

    public void setUVScale(Double UVScale) {
        BigDecimal bigDecimal = new BigDecimal(UVScale);
        double v = bigDecimal.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
        this.UVScale = v;
    }
}
