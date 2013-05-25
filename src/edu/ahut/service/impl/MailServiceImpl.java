/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.MailDao;
import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import edu.ahut.service.MailService;
import edu.ahut.utils.ServiceUtils;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailServiceImpl implements MailService {

    private MailDao mailDao = DaoFactory.getMailDao();
    UserDao userDao = DaoFactory.getUserDao();

    @Override
    public void saveMail(Mail mail, String toUserId, User sendUser) {
        if (!ServiceUtils.checkStringParam(toUserId)) {
            throw new IllegalArgumentException("别瞎点");
        }
        if (mail == null || sendUser == null) {
            throw new IllegalArgumentException("别瞎点");
        }
        User recvUser = userDao.findUser(toUserId);
        mail.setId(ServiceUtils.generateID());
        mail.setSendUser(sendUser);
        mail.setRecvUser(recvUser);
        mailDao.saveMail(mail);
    }
}
