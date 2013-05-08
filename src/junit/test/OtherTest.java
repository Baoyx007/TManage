/**
 *
 */
package junit.test;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Role;
import org.junit.Test;

import edu.ahut.utils.ServiceUtils;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class OtherTest {

    @Test
    public void getPWD() {
        //ICy5YqxZB1uWSwcVLSNLcA==
        System.out.println(ServiceUtils.md5("123"));
    }

    @Test
    public void testEnum() throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Admin admin = new Admin();
        //setRole(Role role)
        Method setter = Admin.class.getMethod("setRole", Role.class);
        setter.invoke(admin, Enum.valueOf(Role.class, (String) "SUPER"));

        System.out.println(admin.getRole());
    }

    @Test
    public void testEnum2() {
        System.out.println(Role.STUDENT.toString());
    }

    @Test
    public void TestURL() throws UnsupportedEncodingException {
        String decode = java.net.URLDecoder.decode("F%3a%5cJava%5cDrill%5cTManage%5cbuild%5cweb%5cWEB-INF%5cupload%5cstudent%5c%e5%ae%89%e5%be%bd%e5%b7%a5%e4%b8%9a%e5%a4%a7%e5%ad%a6%5c%e8%ae%a1%e7%ae%97%e6%9c%ba%e5%ad%a6%e9%99%a2%5c094%5c099074106", "UTF-8");
//         String uuidFilePath = new String("F%3a%5cJava%5cDrill%5cTManage%5cbuild%5cweb%5cWEB-INF%5cupload%5cstudent%5c安徽工业大学%5c计算机学院%5c094%5c099074106".getBytes(""), "utf-8");
        System.out.println("F%3a%5cJava%5cDrill%5cTManage%5cbuild%5cweb%5cWEB-INF%5cupload%5cstudent%5c%e5%ae%89%e5%be%bd%e5%b7%a5%e4%b8%9a%e5%a4%a7%e5%ad%a6%5c%e8%ae%a1%e7%ae%97%e6%9c%ba%e5%ad%a6%e9%99%a2%5c094%5c099074106");
        System.out.println(decode);
    }
}
