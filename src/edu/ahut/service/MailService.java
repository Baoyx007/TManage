/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public interface MailService extends BasicService<Mail> {
    
    public void saveMail(Mail mail, User revcUser, User sendUser);
    
    public List<Mail> getUnreadMail(User user);
    
    public List<Mail> getReadedMail(User user);
}
