/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.domain.Admin;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 13, 2013
 */
public class UserServiceTest {

    @Test
    public void testFindAdmin() {
        Admin adminLogin = ServiceFactory.getUserService().adminLogin("byx", "123");
        System.out.println("");
    }
}
