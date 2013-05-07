/**
 *
 */
package junit.test;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import org.junit.Test;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Gender;
import edu.ahut.domain.Qualification;
import edu.ahut.domain.Role;
import edu.ahut.domain.Unit;
import edu.ahut.domain.User;
import edu.ahut.utils.ServiceUtils;
import java.util.Date;
import org.junit.Before;
import org.junit.Ignore;

/**
 * @author Haven
 * @date 2013-4-3
 *
 */
public class UserDaoTest {

    UserDao userDao = null;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        userDao = DaoFactory.getUserDao();
    }

    @Ignore
    public void addAdmin() {
        Admin admin = new Admin();
        admin.setId(ServiceUtils.generateID());
        admin.setName("baoyx");
        admin.setUsername("byx");
        admin.setPassword(ServiceUtils.md5("123"));
        admin.setEmail("bad@sedf.cd");
        admin.setRole(Role.SUPER);
        userDao.addAdmin(admin);
    }

    @Test
    public void addUser() {
        User user = new User();
        user.setId(ServiceUtils.generateID());
        user.setName("baoyx");
        user.setUsername("byx");
        user.setPassword(ServiceUtils.md5("123"));
        user.setGender(Gender.MALE);
        user.setBirthday(new Date());
        user.setEmail("bad@sedf.cd");
        user.setSchoolNumber("214334");
        user.setRole(Role.STUDENT);
        Unit unit = new Unit();
        unit.setId(1);
        Qualification qualification = new Qualification();
        qualification.setId(1);
        user.setUnit(unit);
        user.setQualification(qualification);
        user.setRole(Role.STUDENT);
        user.setTitle("normal student");
        userDao.addUser(user);
        System.out.println("ss");
    }

    @Test
    public void findUser() {
        User user = userDao.findUser("byx", ServiceUtils.md5("123"));
        System.out.println(user);
    }

    @Test
    public void testEnum() {
        System.out.println(Role.STUDENT);
    }
}
