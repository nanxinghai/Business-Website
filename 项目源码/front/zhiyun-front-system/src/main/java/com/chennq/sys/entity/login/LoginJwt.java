package com.chennq.sys.entity.login;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/27 21:43
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginJwt {
    private String token;
    private User userInfo;
    private List<Permission> permissionList;
}
