/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.JournalDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Journal;
import edu.ahut.domain.Student;
import edu.ahut.utils.HibernateUtil;
import java.util.Date;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date May 31, 2013
 */
public class JournalDaoTest {

    JournalDao journalDao = null;

    @Before
    public void setUp() throws Exception {
        HibernateUtil.getCurrentSession().beginTransaction();
        journalDao = DaoFactory.getJournalDao();
    }

    @Test
    public void testAdd() {
        Journal journal = new Journal();
        journal.setContent("dsfasfsdf");
        journal.setOpinion("sdfasfasdfasdf");
        journal.setReviewDate(new Date());
        journal.setSumbitDate(new Date());
        journal.setTopic("sdfsdfsd");
        journal.setStudent(new Student(196608));
        journalDao.save(journal);
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
