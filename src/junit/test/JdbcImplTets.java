/**
 *
 */
package junit.test;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;

import edu.ahut.dao.impl.UserDaoJdbcImpl;
import edu.ahut.domain.Gender;
import edu.ahut.domain.Manager;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class JdbcImplTets {

    UserDaoJdbcImpl impl = null;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        impl = new UserDaoJdbcImpl();
    }

    @Test
    public void addUser() {
        impl.addUser(new Manager(ServiceUtils.generateID(), "baoyx",
                new Date(), Gender.MALE, "qwe", "qwe"));

    }

    @Test
    public void findUser() {
        // User manager = impl.findUser("qwe", "qwe", Manager.class);
        User student = impl.findUser("byx", "123",
                Student.class);
        System.out.println(student);
    }

    @Test
    public void testEnum() {
        System.out.println(Gender.MALE);
    }
}
