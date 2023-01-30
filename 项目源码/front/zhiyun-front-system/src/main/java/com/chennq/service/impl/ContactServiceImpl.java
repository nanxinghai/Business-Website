package com.chennq.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chennq.entity.Contact;
import com.chennq.mapper.ContactMapper;
import com.chennq.service.ContactService;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.*;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 20:13
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class ContactServiceImpl extends ServiceImpl<ContactMapper, Contact> implements ContactService {

    @Override
    public ResponseEntity<Contact> getContactData() {
        return null;
    }
}
