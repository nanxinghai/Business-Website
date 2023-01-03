package com.chennq.controller;

import com.chennq.constant.ProConstant;
import com.chennq.entity.Logo;
import com.chennq.service.LogoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 23:28
 * @description：
 * @modified By：
 * @version: v1.0
 */
@RestController
@RequestMapping("/logo")
public class LogoController {

    @Autowired
    private LogoService logoService;

    @GetMapping("/getLogoData")
    public Logo getLogoData(){
        String property = System.getProperty("user.dir");
        Logo logo = logoService.getOne(null);
        String filePath = property + ProConstant.FILE_PREFIX + logo.getPath();
        System.out.println(filePath);
        return null;
    }
}
