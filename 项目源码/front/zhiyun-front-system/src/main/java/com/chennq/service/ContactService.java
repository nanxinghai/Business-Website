package com.chennq.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chennq.entity.Contact;
import org.springframework.http.ResponseEntity;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 20:12
 * @description：
 * @modified By：
 * @version: v1.0
 */
public interface ContactService extends IService<Contact> {
    /**
     * 获取隐私政策数据
     * @return
     */
    ResponseEntity<Contact> getContactData();
}
