/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.MailDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Mail;
import edu.ahut.domain.Student;
import edu.ahut.utils.HibernateUtil;
import java.util.Iterator;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailDaoTest {

    MailDao mailDao = null;

    @Before
    public void setUp() {
        HibernateUtil.getCurrentSession().beginTransaction();
        mailDao = DaoFactory.getMailDao();
    }

    @Test
    public void testSave() {
        Mail mail = new Mail();
        mail.setRecvUser(new Student(32768));
        mail.setSendUser(new Student(65536));
        mail.setTopic("haha");
        mail.setContent("dsfsdfsdfsdfsd");
        mailDao.save(mail);
    }

    @Test
    public void testgetMail() {
        List<Mail> allMyMail = mailDao.getAllMyMail(new Student(32768));
        for (Iterator<Mail> it = allMyMail.iterator(); it.hasNext();) {
            Mail mail = it.next();
            System.out.println(mail.getRecvUser().getName());
        }
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
