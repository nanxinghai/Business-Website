package com.chennq.sys.entity.settings.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChangeUserRoleDto {
    private String userId;
    private String roleId;
    private Boolean isChecked;
}
