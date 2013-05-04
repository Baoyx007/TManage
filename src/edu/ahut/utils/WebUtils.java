/**
 *
 */
package edu.ahut.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

/**
 * @author Haven
 * @date 2013-3-23
 *
 */
public class WebUtils {
    // 将post中的数据封装到bean中

    public static <T> T request2Bean(HttpServletRequest request,
            Class<T> beanClass) {
        try {
            request.setCharacterEncoding("utf-8");
            T bean = beanClass.newInstance();
            // 2.request中的数据整到bean中
            Enumeration<String> paras = request.getParameterNames();
            while (paras.hasMoreElements()) {
                String name = paras.nextElement();
                String value = request.getParameter(name);

                BeanUtils.setProperty(bean, name, value);
                // System.out.println(name);
                // ????¤§?¤?
                // 要加这个request.setCharacterEncoding("utf-8");
            }
            return bean;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void copyBean(Object src, Object dest) {
        try {

            ConvertUtils.register(new Converter() {
                @Override
                public Object convert(Class type, Object value) {
                    if (value == null) {
                        return null;
                    }
                    String str = (String) value;
                    if (str.trim().equals("")) {
                        return null;
                    }
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        return df.parse(str);
                    } catch (ParseException e) {

                        e.printStackTrace();
                        throw new RuntimeException(e);
                    }
                }
            }, Date.class);
            BeanUtils.copyProperties(dest, src);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
