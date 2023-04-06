package com.chennq.sys.service.front.impl;

import com.chennq.sys.entity.front.SysContact;
import com.chennq.sys.mapper.front.SysContactMapper;
import com.chennq.sys.service.front.SysContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysContactServiceImpl implements SysContactService {

    @Autowired
    private SysContactMapper sysContactMapper;

    @Override
    public SysContact getContact() {
        return sysContactMapper.selectOne(null);
    }

    @Override
    public void edidContact(SysContact sysContact) {
        sysContactMapper.updateById(sysContact);
    }
}
