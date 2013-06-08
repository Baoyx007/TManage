/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.ArchiveDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.utils.HibernateUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class ArchiveDaoTest {

    ArchiveDao archiveDao = null;

    @Before
    public void setUp() throws Exception {
        HibernateUtil.getCurrentSession().beginTransaction();
        archiveDao = DaoFactory.getArchiveDao();
    }

    @Test
    public void testAdd() {
        Archive archive = new Archive();
        archive.setSubject(new Subject(2));
        archive.setThesis(new Thesis(13));
        archiveDao.save(archive);
    }

    @After
    public void cleanUp() {
        HibernateUtil.getCurrentSession().getTransaction().commit();
    }
}
