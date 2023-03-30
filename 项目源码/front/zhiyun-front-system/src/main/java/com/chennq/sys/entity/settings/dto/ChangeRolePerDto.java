package com.chennq.sys.entity.settings.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChangeRolePerDto {
    private Long id;
    private String roleId;
    private Boolean isChecked;
}
