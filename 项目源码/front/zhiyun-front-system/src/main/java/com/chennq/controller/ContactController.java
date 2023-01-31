package com.chennq.controller;

import com.chennq.base.annotation.ResultApi;
import com.chennq.entity.Contact;
import com.chennq.service.ContactService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 20:15
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Api(tags = "前台联系我们模块对象功能接口")
@RestController
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    private ContactService contactService;

    @ResultApi
    @ApiOperation("查询已启用数据")
    @GetMapping("/getContactData")
    public Contact getContactData(){
        return contactService.getOne(null);
    }


}
