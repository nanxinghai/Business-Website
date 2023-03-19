package com.chennq.sys.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author ：Simon
 * @date ：Created in 2023/2/26 1:49
 * @description：
 * @modified By：
 * @version: v1.0
 */
public class WebUtil {

    public static void write(HttpServletResponse response,String json) {
        //设置编码格式
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("拦截创建printwriter失败");
        }
        pw.print(json);
        pw.flush();
        pw.close();
    }
}
