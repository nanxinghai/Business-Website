package com.chennq.sys.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/23 22:26
 * @description：
 * @modified By：
 * @version: v1.0
 */
public class JwtUtil {
    //加密 解密时的密钥 用来生成key
    public static final String JWT_KEY = "IT1995";


    public static String createJWT(String subject){
//创建JwtBuilder对象
        JwtBuilder jwtBuilder = Jwts.builder()
                //声明的唯一标识{"jti":"6666"}
//                .setId("6666")
                //主体，面向的用户{"sub":"Test"}
                .setSubject(subject)
                //签发时间{"iat":"xxxxx"}
                .setIssuedAt(new Date())
                //签证
                .signWith(SignatureAlgorithm.HS256, JWT_KEY);
        //获取jwt的token
        String token = jwtBuilder.compact();
        return token;
    }

    public static Claims parseJWT(String jwt){
        Claims claims = Jwts.parser()
                .setSigningKey(JWT_KEY)
                .parseClaimsJws(jwt)
                .getBody();
        return claims;
    }

    public static void main(String[] args) {
//        String jwt = createJWT("1234");
//        System.out.println(jwt);
//        eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0IiwiaWF0IjoxNjc3MTYzNDc3fQ.iQlSEBhy0_57WzMbTzDZqWMT0JCi8I9XgQyY-hSiA2I
        Claims claims = parseJWT("eyJzdWIiOiIxMjM0IiwiaWF0IjoxNjc3MTYzNDc3fQ.iQlSEBhy0_57WzMbTzDZqWMT0JCi8I9XgQyY-hSiA2I");
        System.out.println(claims.getSubject());
    }
}
