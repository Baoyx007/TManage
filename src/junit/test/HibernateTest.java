/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.domain.Gender;
import edu.ahut.domain.Qualification;
import edu.ahut.domain.Student;
import edu.ahut.domain.Unit;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 25, 2013
 */
public class HibernateTest {

    @Test
    public void addStudentTest() {
        Student u = new Student();
        u.setName("jess");
        u.setUsername("byx");
        u.setPassword("123");
        u.setGender(Gender.MALE);
        u.setBirthday(new Date());
        u.setSchoolNumber("099074016");

        Qualification qualification = new Qualification();
        qualification.setCollege("dddd");
        qualification.setDegree("sdds");
        qualification.setStartTime(2013);
        u.setQualification(qualification);
        Unit unit = new Unit();
        unit.setSchool("shut");
        unit.setDepartment("com");
        unit.setCalss("094");
        u.setUnit(unit);
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            s.save(unit);
            s.save(qualification);
            s.save(u);
            s.getTransaction().commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Test
    public void readUserTest() {
        User u = new Student();
        u.setName("jess");
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            Query q = s.createQuery(
                    "from Student as s where s.name = :name");
            q.setString("name", "jess");

            //第一条记录,分页
            q.setFirstResult(0);
            //多少条记录
            q.setMaxResults(2);
            List<User> list = q.list();
            for (Iterator<User> it = list.iterator(); it.hasNext();) {
                User user = it.next();
                System.out.println(user.getId() + ":" + user.getName());
            }
//            User user = (User) query.uniqueResult();
//            System.out.println(user.getId());
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }
}
