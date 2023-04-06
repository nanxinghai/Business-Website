package com.chennq.sys.controller.front;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.front.SysContact;
import com.chennq.sys.service.front.SysContactService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "后台联系我们功能接口")
@RestController
@RequestMapping("/sys/contact")
public class SysContactController {
    @Autowired
    private SysContactService sysContactService;

    @ResultApi
    @ApiOperation("查询联系我们信息")
    @PreAuthorize("hasAuthority('sys:contact:getContact')")
    @PostMapping("/getContact")
    public SysContact getContact(){
        return sysContactService.getContact();
    }

    @ResultApi
    @ApiOperation("编辑联系我们信息")
    @PreAuthorize("hasAuthority('sys:contact:edidContact')")
    @PostMapping("/edidContact")
    public void edidContact(@RequestBody SysContact sysContact){
        sysContactService.edidContact(sysContact);
    }
}
