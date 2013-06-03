/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.AnswerGroupDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.utils.HibernateUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class AnswerGroupDaoTest {

    AnswerGroupDao answerGroupDao = null;

    @Before
    public void setUp() throws Exception {
        HibernateUtil.getCurrentSession().beginTransaction();
        answerGroupDao = DaoFactory.getAnswerGroupDao();
    }

    @Test
    public void testClear() {
        answerGroupDao.clearDate();
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
