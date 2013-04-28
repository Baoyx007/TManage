/**
 * 
 */
package junit.test;

import org.junit.Test;

import edu.ahut.service.impl.SubjectServiceImpl;

/**
 * @author Haven
 * @date 2013-4-3
 * 
 */
public class SubjectServiceTest {
    @Test
    public void testList() {
	SubjectServiceImpl impl = new SubjectServiceImpl();
	System.out.println(impl.listAllSubject());
    }
}
