/**
 *
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.AnswerGroupDao;
import edu.ahut.dao.BasicDao;
import edu.ahut.dao.BulletinDao;
import edu.ahut.dao.JournalDao;
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
        return new SubjectDaoHibImpl();
    }

    public static ThesisDao getThesisDao() {
        return new ThesisDaoHibImpl();
    }

    public static UserDao getUserDao() {
        return new UserDaoHibImpl();
    }

    public static BulletinDao getBulletinDao() {
        return new BulletinDaoHibImpl();
    }

    public static MailDao getMailDao() {
        return new MailDaoHibImpl();
    }

    public static BasicDao getBasicDao() {
        return new BasicDaoHibImpl();
    }

    public static JournalDao getJournalDao() {
        return new JournalDaoHibImpl();
    }

    public static AnswerGroupDao getAnswerGroupDao() {
        return new AnswerGroupDaoHibImpl();
    }
}
