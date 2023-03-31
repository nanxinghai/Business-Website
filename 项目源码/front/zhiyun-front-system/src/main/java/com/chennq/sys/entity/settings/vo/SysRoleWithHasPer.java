package com.chennq.sys.entity.settings.vo;

import com.chennq.sys.entity.settings.SysRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysRoleWithHasPer {
    private List<SysRole> list;
    private List<Long> isCheckIds;
}
