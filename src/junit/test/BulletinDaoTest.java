/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package junit.test;

import edu.ahut.dao.BulletinDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import edu.ahut.domain.User;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.junit.*;

/**
 *
 * @author Haven
 * @date May 26, 2013
 */
public class BulletinDaoTest {

    BulletinDao bulletinDao = null;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        bulletinDao = DaoFactory.getBulletinDao();
    }

    @Test
    public void testSave() {
        for (int i = 0; i < 10; i++) {
            Bulletin bulletin = new Bulletin();
            bulletin.setTopic("sdsdsd");
            bulletin.setContent("sdfsadfafasf");
            bulletin.setTime(new Date(System.currentTimeMillis()));
            User findUser = DaoFactory.getUserDao().findUser(262144);
            bulletin.setAdmin((Admin) findUser);
            bulletinDao.saveBulletin(bulletin);
        }
    }

    @Test
    public void testGet() {
        Bulletin bulletinById = bulletinDao.getBulletinById(5);
        System.out.println(bulletinById.getTime());
//        System.out.println(bulletinById.getAdmin());
    }

    @Test
    public void testGetAll() {
        List<Bulletin> allBulletin = bulletinDao.getAllBulletin();
        for (Iterator<Bulletin> it = allBulletin.iterator(); it.hasNext();) {
            Bulletin bulletin = it.next();
            System.out.println(bulletin.getTime());
        }
    }
}
