/**
 *
 */
package junit.test;

import org.junit.Test;

import edu.ahut.domain.Student;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class OtherTest {

    @Test
    public void tt() {
        // System.out.println(User.class.getSimpleName());
        // System.out.println(ServiceUtils.md5("123"));
        Student s = new Student();
        System.out.println(s.getClass().getName());
    }

    @Test
    public void getPWD() {
        //ICy5YqxZB1uWSwcVLSNLcA==
        System.out.println(ServiceUtils.md5("123"));
    }
}
