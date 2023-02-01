package com.chennq.entity.vo;

import com.chennq.entity.Phone;
import com.chennq.entity.Qrcode;
import lombok.Data;

import java.util.List;

@Data
public class FootVo {
    private List<Phone> phoneList;
    private Qrcode qrcode;
}
