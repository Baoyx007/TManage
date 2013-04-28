/**
 * 
 */
package junit.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.dao.impl.ThesisDaoImpl;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-4-5
 * 
 */
public class ThesisDaoTest {
    @Test
    public void testAdd() {
	Thesis thesis = new Thesis();
	thesis.setId(ServiceUtils.generateID());
	thesis.setRealFileName("sd");
	thesis.setUuidFileName("sd");
	thesis.setStudentComment("sd");
	thesis.setSubmitDate(new java.sql.Date(new Date().getTime()));

	Subject subject = new Subject();
	subject.setId("2");
	thesis.setSubject(subject);

	new ThesisDaoImpl().addThesis(thesis);
    }

    @Test
    public void testGet() {
	List<Thesis> thesesBySbId = DaoFactory.getThesisDao().getThesesBySbId("1");
	System.out.println(thesesBySbId);
    }

}
