package com.chennq.sys.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.Enumeration;
import java.util.Map;
import java.util.Vector;

/**
 * 由于request对象中的属性不能更改，所以我们重写request对象，并将其覆盖
 */
public class ChangeRequestWrapper extends HttpServletRequestWrapper {

    private Map<String, String[]> parameterMap; // 所有参数的Map集合

    /**
     * ChangeRequestWrapper构造函数
     * @param request
     */
    public ChangeRequestWrapper(HttpServletRequest request) {
        super(request);
        // 给参数集合赋值
        parameterMap = request.getParameterMap();
    }


    /**
     * 获取所有参数名
     *
     * @return 返回所有参数名
     */
    @Override
    public Enumeration<String> getParameterNames() {
        Vector<String> vector = new Vector<String>(parameterMap.keySet());
        return vector.elements();
    }

    /**
     * 获取指定参数名的值，如果有重复的参数名，则返回第一个的值 接收一般变量 ，如text类型
     *
     * @param name 指定参数名
     * @return 指定参数名的值
     */
    @Override
    public String getParameter(String name) {
        String result = super.getParameter(name);
        return result;
    }


    /**
     * 获取指定参数名的所有值的数组，如：checkbox的所有数据
     * 接收数组变量 ，如checkobx类型
     */
    @Override
    public String[] getParameterValues(String name) {
        return parameterMap.get(name);
    }

    @Override
    public Map<String, String[]> getParameterMap() {
        return parameterMap;
    }

    public void setParameterMap(Map<String, String[]> parameterMap) {
        this.parameterMap = parameterMap;
    }

}
