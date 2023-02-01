package com.chennq.service.impl;

import com.chennq.entity.Phone;
import com.chennq.entity.Qrcode;
import com.chennq.entity.vo.FootVo;
import com.chennq.mapper.PhoneMapper;
import com.chennq.mapper.QrcodeMapper;
import com.chennq.service.FootService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FootServiceImpl implements FootService {
    @Autowired
    private PhoneMapper phoneMapper;
    @Autowired
    private QrcodeMapper qrcodeMapper;


    @Override
    public FootVo getFootData() {
        List<Phone> phones = phoneMapper.selectList(null);
        Qrcode qrcode = qrcodeMapper.selectOne(null);
        FootVo footVo = new FootVo();
        footVo.setPhoneList(phones);
        footVo.setQrcode(qrcode);
        return footVo;
    }
}
