package com.chennq.base.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Map;

public class HttpClientUtil {

    /**
     * post请求
     * @param url  请求地址
     * @param paramMap  请求参数
     * @return
     */
    public static String post(String url, Map paramMap) {
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        // 创建httpPost远程连接实例
        HttpPost post = new HttpPost(url);
        String result = "";
        try (CloseableHttpClient closeableHttpClient = httpClientBuilder.build()) {
            // HttpEntity entity = new StringEntity(jsonDataStr);
            // 修复 POST json 导致中文乱码
            HttpEntity entity = new StringEntity(paramMap.toString(), "UTF-8");
            post.setEntity(entity);
            post.setHeader("Content-type", "application/json");
            HttpResponse resp = closeableHttpClient.execute(post);
            try {
                HttpEntity entity1 = resp.getEntity();
                result = EntityUtils.toString(entity1);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
