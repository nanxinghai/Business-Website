package com.chennq.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chennq.entity.Contact;
import com.chennq.mapper.ContactMapper;
import com.chennq.service.ContactService;
import org.springframework.stereotype.Service;

/**
 * @author ：Simon
 * @date ：Created in 2022/12/14 20:13
 * @description：
 * @modified By：
 * @version: v1.0
 */
@Service
public class ContactServiceImpl extends ServiceImpl<ContactMapper, Contact> implements ContactService {

}
