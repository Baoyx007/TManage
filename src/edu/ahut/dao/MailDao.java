/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao;

import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public interface MailDao {

    public void saveMail(Mail mail);

    public List<Mail> getAllMail(User user);

    public List<Mail> getUnreadMail(User user);
}
