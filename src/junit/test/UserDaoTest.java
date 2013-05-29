/**
 *
 */
package junit.test;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Admin;
import org.junit.Test;

import edu.ahut.domain.Gender;
import edu.ahut.domain.Mail;
import edu.ahut.domain.Qualification;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.Unit;
import edu.ahut.utils.HibernateUtil;
import edu.ahut.utils.ServiceUtils;
import java.util.Date;
import java.util.Iterator;
import org.junit.After;
import org.junit.Before;

/**
 * add都OK
 *
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
        HibernateUtil.getCurrentSession().beginTransaction();
        userDao = DaoFactory.getUserDao();

    }

    @Test
    public void addAdmin() {
        Admin admin = new Admin();
        admin.setName("baoyx");
        admin.setUsername("admin");
        admin.setPassword(ServiceUtils.md5("123"));
        admin.setEmail("bad@sedf.cd");
        admin.setSuperAdmin(true);
        admin.setComment("hhhhhhhhhhhhhhhhhhh");
//        userDao.addAdmin(admin);
        userDao.addUser(admin);
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
    public void addTeacher() {
        Teacher t = new Teacher();
        t.setName("储岳中");
        t.setUsername("chu");
        t.setPassword(ServiceUtils.md5("123"));
        t.setGender(Gender.MALE);
        t.setBirthday(new Date());
        t.setEmail("e@sdf.com");
        t.setSchoolNumber("09907232416");
        t.setAddress("j3#ewrfqe");
//
//        Qualification qualification = new Qualification();
//        qualification.setCollege("安工大");
//        qualification.setDegree("学士");
//        qualification.setStartTime(2013);
//        t.setQualification(qualification);
//        Unit unit = new Unit();
//        unit.setSchool("安工大");
//        unit.setDepartment("计算机");
//        unit.setCalss("094");
//        t.setUnit(unit);
        userDao.addUser(t);
//        userDao.addStudent(student);
    }

    @Test
    public void findUserByUP() {
        Student user = (Student) userDao.findUser("byx", ServiceUtils.md5("123"));
        System.out.println(user.getGender());
    }

    @Test
    public void findUserById() {
        Student user = (Student) userDao.findUser(196608, false);
        System.out.println(user.getName());
        for (Iterator<Subject> it = user.getSubjects().iterator(); it.hasNext();) {
            Subject subject = it.next();
            System.out.println(subject.getTitle());
        }
        for (Iterator<Mail> it = user.getInBoxMails().iterator(); it.hasNext();) {
            Mail mail = it.next();
            System.out.println(mail.getTopic());
        }
    }

    @Test
    public void findAdmin() {
//        Admin_bak admin = userDao.findAdmin("byx", ServiceUtils.md5("123"));
//        System.out.println(admin);
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
