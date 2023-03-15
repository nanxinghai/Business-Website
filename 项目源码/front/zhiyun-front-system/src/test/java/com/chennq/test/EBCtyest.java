package com.chennq.test;

import com.chennq.ZYWebsiteApplication;
import org.jasypt.encryption.StringEncryptor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author ：Simon
 * @date ：Created in 2023/3/15 22:29
 * @description：
 * @modified By：
 * @version: v1.0
 */
@RunWith(SpringRunner.class) //作用：让当前类在容器环境下进行测试
@SpringBootTest(classes = ZYWebsiteApplication.class)
public class EBCtyest {
    @Autowired
    StringEncryptor encryptor;

    @Test
    public void getPass() {
        String name = encryptor.encrypt("root");
        String password = encryptor.encrypt("");
        System.out.println(name+"----------------");
        System.out.println(password+"----------------");
    }
}
