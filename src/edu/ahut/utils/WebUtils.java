/**
 *
 */
package edu.ahut.utils;

import edu.ahut.domain.Gender;
import java.lang.reflect.Method;
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
            T bean = beanClass.newInstance();
            // 2.request中的数据整到bean中
            Enumeration<String> paras = request.getParameterNames();
            while (paras.hasMoreElements()) {
                String name = paras.nextElement();
                String value = request.getParameter(name);
                if (name.equals("gender")) {
                    Method declaredMethod = beanClass.getDeclaredMethod("setGender", Gender.class);
                    if ("MALE".equals(value)) {
                        declaredMethod.invoke(bean, Gender.MALE);
                    } else if ("FEMALE".equals(value)) {
                        declaredMethod.invoke(bean, Gender.FEMALE);
                    }
                    continue;
                }
                BeanUtils.setProperty(bean, name, value);
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
