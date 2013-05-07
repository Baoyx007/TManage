/**
 *
 */
package junit.test;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Role;
import org.junit.Test;

import edu.ahut.utils.ServiceUtils;
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
}
