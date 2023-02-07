package com.chennq.base.util;

import com.alibaba.fastjson.JSONObject;
import com.chennq.entity.Log;
import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.model.CityResponse;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.core.io.ClassPathResource;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class IpUtil {

    public static Log getLog(HttpServletRequest request){
        String browserName = browserName(request);
        String osName = osName(request);
        String ipAddress = getIpAddress(request);
        String realAddress = getRealAddress(ipAddress);
        Log log = new Log();
        log.setBrowername(browserName);
        log.setOsname(osName);
        log.setIp(ipAddress);
        log.setAddr(realAddress);
        return log;
    }

    /**
     * 浏览器版本
     * @param request
     * @return
     */
    public static String browserName(HttpServletRequest request){
        String userAgent = request.getHeader("User-Agent");
        UserAgent ua = UserAgent.parseUserAgentString(userAgent);
        Browser browser = ua.getBrowser();
        return browser.getName() + "-" + browser.getVersion(userAgent);
    }

    /**
     * 操作系统
     * @param request
     * @return
     */
    public static String osName(HttpServletRequest request){
        String userAgent = request.getHeader("User-Agent");
        UserAgent ua = UserAgent.parseUserAgentString(userAgent);
        OperatingSystem os = ua.getOperatingSystem();
        return os.getName();
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_FORWARDED");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_VIA");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip.contains(",")) {
            return ip.split(",")[0];
        } else {
            return ip;
        }
    }

    /**
     * description 地址库查询
     *
     * @param ip 地址
     * @return java.lang.String
     * @version 1.0
     */
    public static String getRealAddress(String ip) {
        if(ip.equals("127.0.0.1") || ip.equals("localhost")){
            return "本机地址";
        }
        String result = "";
        try {
            // 加载地址库
            ClassPathResource resource = new ClassPathResource("GeoLite2-City.mmdb");
            DatabaseReader reader = new DatabaseReader.Builder(resource.getInputStream()).build();
            InetAddress inetAddress = InetAddress.getByName(ip);
            CityResponse response = reader.city(inetAddress);
            // 获取所在国家
            String country = response.getCountry().getNames().get("ja");
            // 库内获取不到的IP，访问ali的地域查询
            if (response.getSubdivisions().size() > 0) {
                // 获取所在省份
                String province = response.getSubdivisions().get(0).getNames().get("zh-CN");
                // 获取所在城市
                String city = response.getCity().getNames().get("zh-CN");
                city = city == null ? "" : city;
                result = country + province + city;
            } else {
                result = getAlibaba(ip);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * description ali地域查询
     *
     * @param ip ip地址
     * @return java.lang.String
     * @version 1.0
     */
    public static String getAlibaba(String ip) {
        Map map = new HashMap();
        map.put("ip", ip);
        map.put("accessKey", "alibaba-inc");
        String result = HttpClientUtil.post("http://ip.taobao.com/outGetIpInfo", map);
        Map valueMap = JSONObject.parseObject(result, Map.class);
//        System.out.println("successs" + result);
        // 请求成功，解析响应数据
        if ("query success".equals(valueMap.get("msg"))) {
            Map<String, String> dataMap = (Map<String, String>) valueMap.get("data");
            String country = dataMap.get("country");
            String region = dataMap.get("region");
            String city = dataMap.get("city");
            return country + region + city;
        }
        return "";
    }

    public static void main(String[] args) {
        String[] a = {"a","v"};
        String s = Arrays.toString(a);
        System.out.println(s);
    }

}
