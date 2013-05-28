/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.MailDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import edu.ahut.service.MailService;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailServiceImpl implements MailService {

    private MailDao mailDao = DaoFactory.getMailDao();

    @Override
    public void saveMail(Mail mail, User revcUser, User sendUser) {
        if (mail == null || sendUser == null || revcUser == null) {
            throw new IllegalArgumentException("别瞎点");
        }
        mail.setSendUser(sendUser);
        mail.setRecvUser(revcUser);
        mailDao.save(mail);
    }
}
