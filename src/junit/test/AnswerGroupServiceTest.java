/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.service.AnswerGroupService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.HibernateUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class AnswerGroupServiceTest {

    AnswerGroupService answerGroupService = null;

    @Before
    public void setUp() throws Exception {
        HibernateUtil.getCurrentSession().beginTransaction();
        answerGroupService = ServiceFactory.getAnswerGroupService();
    }

    @Test
    public void testRandom() {
        answerGroupService.setRandomGroups(7);
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
