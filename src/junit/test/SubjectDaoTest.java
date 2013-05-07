/**
 *
 */
package junit.test;

import java.util.List;

import org.junit.Test;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.impl.SubjectDaoImpl;
import edu.ahut.domain.Subject;
import edu.ahut.domain.User;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectDaoTest {

    @Test
    public void testAdd() {
        SubjectDao dao = new SubjectDaoImpl();
        Subject subject = new Subject();
        subject.setId(ServiceUtils.generateID());
        subject.setTitle("test");
        subject.setDescription("所得税的发生的水电费");
        subject.setTeacher(new User("1"));
        dao.addSubject(subject);
    }

    @Test
    public void testlist() {
        List<Subject> allSubject = new SubjectDaoImpl().getAllSubject();
        for (Subject s : allSubject) {
            System.out.println(s);
        }
    }

    @Test
    public void testSelect() {
        new SubjectDaoImpl().selectSubject("2", "1");
    }

    @Test
    public void find() {
        Subject subject = new SubjectDaoImpl().findSubjectBySid("1");
        System.out.println(subject);
    }
}
