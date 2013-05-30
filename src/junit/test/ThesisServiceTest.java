/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.domain.Teacher;
import edu.ahut.domain.Thesis;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.HibernateUtil;
import java.util.Iterator;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 30, 2013
 */
public class ThesisServiceTest {

    @Before
    public void setUp() {
        HibernateUtil.getCurrentSession().beginTransaction();
    }

    @Test
    public void testGetUnreadedThesises() {
        List<Thesis> unreadedThesises = ServiceFactory.getThesisService().getUnreadedThesises(new Teacher(327680));
        for (Iterator<Thesis> it = unreadedThesises.iterator(); it.hasNext();) {
            Thesis thesis = it.next();
            System.out.println(thesis.getSubmitDate());
        }
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
