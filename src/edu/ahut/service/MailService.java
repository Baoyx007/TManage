/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.Mail;
import edu.ahut.domain.User;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public interface MailService {

    public void saveMail(Mail mail, String toUserId, User sendUser);
}
