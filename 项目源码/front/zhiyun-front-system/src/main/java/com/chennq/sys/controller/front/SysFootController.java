package com.chennq.sys.controller.front;

import com.chennq.base.annotation.ResultApi;
import com.chennq.sys.entity.PageVo;
import com.chennq.sys.entity.front.SysPhone;
import com.chennq.sys.entity.front.SysQrCode;
import com.chennq.sys.service.front.SysFootService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Api(tags = "后台底部设置功能接口")
@RestController
@RequestMapping("/sys/foot")
public class SysFootController {
    @Autowired
    private SysFootService sysFootService;

    @ResultApi
    @ApiOperation("查询底部设置号码列表")
    @PreAuthorize("hasAuthority('sys:foot:pageList')")
    @PostMapping("/pageList")
    public PageVo<SysPhone> pageList(@RequestBody SysPhone sysPhone){
        return sysFootService.pageList(sysPhone);
    }

    @ResultApi
    @ApiOperation("编辑底部设置号码")
    @PreAuthorize("hasAuthority('sys:foot:editSysPhone')")
    @PostMapping("/editSysPhone")
    public void editSysPhone(@RequestBody SysPhone sysPhone){
        sysFootService.editSysPhone(sysPhone);
    }

    @ResultApi
    @ApiOperation("添加底部设置号码")
    @PreAuthorize("hasAuthority('sys:foot:addOne')")
    @PostMapping("/addOne")
    public void addOne(@RequestBody SysPhone sysPhone){
        sysFootService.addOne(sysPhone);
    }

    @ResultApi
    @ApiOperation("获取底部设置号二维码")
    @PreAuthorize("hasAuthority('sys:foot:getOne')")
    @PostMapping("/getOne")
    public SysQrCode getOne(){
        return sysFootService.getOne();
    }

    @ResultApi
    @ApiOperation("上传底部设置二维码")
    @PreAuthorize("hasAuthority('sys:foot:uploadQrcode')")
    @PostMapping("/uploadQrcode")
    public void uploadQrcode(@RequestParam("file") MultipartFile file, HttpServletRequest request){
        sysFootService.uploadQrcode(file,request);
    }

}
