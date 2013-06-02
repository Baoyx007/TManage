/**
 *
 */
package junit.test;

import org.junit.Test;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.junit.After;
import org.junit.Before;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectDaoTest {

    SubjectDao subjectDao = null;

    @Before
    public void setUp() {
        HibernateUtil.getCurrentSession().beginTransaction();
        subjectDao = DaoFactory.getSubjectDao();
    }

    @Test
    public void testAdd() {
        Subject subject = new Subject();
        subject.setTitle("test");
        subject.setSubmitDate(new Date());
        subject.setDescription("所得税的发生的水电费");
        subject.setStudent(new Student(196608));
        subjectDao.addSubject(subject);
    }

    @Test
    public void testlist() {
        List<Subject> allSubject = subjectDao.getAllSubject();
        for (Subject s : allSubject) {
            System.out.println(s.getId());
            System.out.println(s.getTeacher().getAddress());
        }
    }

    @Test
    public void testSelect() {
        Subject subject = new Subject();
        subject.setTitle("test");
        subject.setDescription(new Date().toString());
        subjectDao.selectSubject(new Student(196608), new Teacher(327680), subject);
    }

    @Test
    public void testSelectWhitoutUser() {
        Subject subject = new Subject();
        subject.setTitle("test");
        subject.setDescription(new Date().toString());
        subjectDao.selectSubject(null, null, subject);
    }

    @Test
    public void testSelectWhitoutTeacher() {
        Subject subject = new Subject();
        subject.setTitle("test");
        subject.setDescription(new Date().toString());
        subject.setTeacher(new Teacher(327680));
        subjectDao.selectSubject(new Student(196608), null, subject);
    }

    @Test
    public void testFindSubjectByStudent() {
        List<Subject> findSubjectByStudent = subjectDao.findSubjectByStudent(new Student(196608));
        System.out.println(findSubjectByStudent);
    }

    @Test
    public void testFindTeacherByStudent() {
        User user = subjectDao.getTeacherByStudent(new Student(196608));
        System.out.println(user.getName());
    }

    @Test
    public void testGetUncheckedSubjects() {
        List<Subject> uncheckedSubjects = subjectDao.getUncheckedSubjects();
        for (Iterator<Subject> it = uncheckedSubjects.iterator(); it.hasNext();) {
            Subject subject = it.next();
            System.out.println(subject.getSubmitDate());
        }
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
