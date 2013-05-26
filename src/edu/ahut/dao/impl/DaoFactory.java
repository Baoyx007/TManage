/**
 *
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.BulletinDao;
import edu.ahut.dao.MailDao;
import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.ThesisDao;
import edu.ahut.dao.UserDao;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class DaoFactory {

    public static SubjectDao getSubjectDao() {
        return new SubjectDaoImpl();
    }

    public static ThesisDao getThesisDao() {
        return new ThesisDaoImpl();
    }

    public static UserDao getUserDao() {
        return new UserDaoHibImpl();
    }

    public static BulletinDao getBulletinDao() {
        return new BulletinDaoHibImpl();
    }

    public static MailDao getMailDao() {
        return new MailDaoImpl();
    }
}
