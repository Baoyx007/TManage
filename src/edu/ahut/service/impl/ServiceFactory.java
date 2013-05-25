/**
 *
 */
package edu.ahut.service.impl;

import edu.ahut.service.BulletinService;
import edu.ahut.service.MailService;
import edu.ahut.service.SubjectService;
import edu.ahut.service.ThesisService;
import edu.ahut.service.UserService;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ServiceFactory {

    public static SubjectService getSubjectService() {
        return new SubjectServiceImpl();
    }

    public static ThesisService getThesisService() {
        return new ThesisServiceImpl();
    }

    public static UserService getUserService() {
        return new UserServiceImpl();
    }

    public static BulletinService getBulletinService() {
        return new BulletinServiceImpl();
    }

    public static MailService getMailService() {
        return new MailServiceImpl();
    }
}
