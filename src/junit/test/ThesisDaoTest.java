/**
 *
 */
package junit.test;

import edu.ahut.dao.ThesisDao;
import java.util.Date;

import org.junit.Test;

import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.Thesis;
import java.util.Iterator;
import java.util.List;
import org.junit.Before;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ThesisDaoTest {
    
    ThesisDao thesisDao = null;
    
    @Before
    public void setUp() {
        thesisDao = DaoFactory.getThesisDao();
    }
    
    @Test
    public void testAdd() {
        Thesis thesis = new Thesis();
        thesis.setRealFileName("sd");
        thesis.setUuidFileName("sd");
        thesis.setStudentComment("sd");
        thesis.setSubmitDate(new Date());
        
        Subject subject = new Subject();
        subject.setTitle("haha");
//        subject.setStudent(new Student());
//        subject.setTeacher(new Teacher());
        thesis.setSubject(subject);
        thesisDao.addThesis(thesis);
        
    }
    
    @Test
    public void testGetThesisById() {
        Thesis thesis = thesisDao.getThesis(1);
        System.out.println(thesis.getSubmitDate());
        System.out.println(thesis.getSubject().getId());
    }
    
    @Test
    public void testGetThesisBySId() {
        List<Thesis> thesesBySbId = thesisDao.getThesesBySubject(new Subject(1));
        for (Iterator<Thesis> it = thesesBySbId.iterator(); it.hasNext();) {
            Thesis thesis = it.next();
            System.out.println(thesis.getSubmitDate());
        }
    }
}
