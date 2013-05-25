/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.impl.MailDaoImpl;
import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import edu.ahut.utils.ServiceUtils;
import java.util.List;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailDaoTest {

    @Test
    public void testSave() {
        Mail mail = new Mail();
        mail.setId(ServiceUtils.generateID());
        mail.setRecvUser(new User("1"));
        mail.setSendUser(new User("4"));
        mail.setTopic("haha");
        mail.setContent("dsfsdfsdfsdfsd");

        new MailDaoImpl().saveMail(mail);
    }

    @Test
    public void testgetMail() {
        List<Mail> allMail = new MailDaoImpl().getAllMail(new User("1"));
        System.out.println("");
    }
}
