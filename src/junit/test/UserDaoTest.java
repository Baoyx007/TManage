/**
 *
 */
package junit.test;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import org.junit.Test;

import edu.ahut.domain.Gender;
import edu.ahut.domain.Qualification;
import edu.ahut.domain.Student;
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
//        Admin_bak admin = new Admin_bak();
//        admin.setId(ServiceUtils.generateID());
//        admin.setName("baoyx");
//        admin.setUsername("byx");
//        admin.setPassword(ServiceUtils.md5("123"));
//        admin.setEmail("bad@sedf.cd");
//        admin.setRole(Role.SUPER);
//        userDao.addAdmin(admin);
    }

    @Test
    public void addStudent() {
        Student student = new Student();
        student.setName("鲍勇翔");
        student.setUsername("byx");
        student.setPassword(ServiceUtils.md5("123"));
        student.setGender(Gender.MALE);
        student.setBirthday(new Date());
        student.setEmail("baoyx007@gmail.com");
        student.setSchoolNumber("099074016");
        student.setAddress("j3#4010");

        Qualification qualification = new Qualification();
        qualification.setCollege("安工大");
        qualification.setDegree("学士");
        qualification.setStartTime(2013);
        student.setQualification(qualification);
        Unit unit = new Unit();
        unit.setSchool("安工大");
        unit.setDepartment("计算机");
        unit.setCalss("094");
        student.setUnit(unit);
        userDao.addUser(student);
//        userDao.addStudent(student);
    }

    @Test
    public void findUserByUP() {
        Student user = (Student) userDao.findUser("byx", ServiceUtils.md5("123"));
        System.out.println(user.getGender());
    }

    @Test
    public void findUserById() {
        User user = userDao.findUser(196608);
        System.out.println(user.getName());
    }

    @Test
    public void findAdmin() {
//        Admin_bak admin = userDao.findAdmin("byx", ServiceUtils.md5("123"));
//        System.out.println(admin);
    }
}
