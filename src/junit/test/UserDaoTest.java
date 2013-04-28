/**
 * 
 */
package junit.test;

import org.junit.Test;

import edu.ahut.dao.impl.UserDaoJdbcImpl;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-4-3
 * 
 */
public class UserDaoTest {
    @Test
    public void testFindTeacher() {
	User findTeacher = new UserDaoJdbcImpl().findTeacher("1");
	System.out.println(findTeacher);
    }
}
