/**
 * 
 */
package junit.test;

import org.junit.Test;

import edu.ahut.domain.User;
import edu.ahut.service.impl.UserServiceImpl;

/**
 * @author Haven
 * @date 2013-3-30
 * 
 */
public class ServiceTest {
    @Test
    public void loginTest() {
	User u = new UserServiceImpl().login("qwe", "qwe", "manager");

	System.out.println(u);
    }
}
