/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.MailDao;
import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Haven
 * @date May 28, 2013
 */
public class MailDaoHibImpl extends BasicDaoHibImpl<Mail> implements MailDao {

    @Override
    public List<Mail> getAllMyMail(User user) {
        String hql = "from Mail as mail where mail.recvUser=:u order by mail.sendTime desc";
        Query query = getSession().createQuery(hql);
        query.setParameter("u", user);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public List<Mail> getUnreadMail(User user) {
        String hql = "from Mail as mail where mail.recvUser=:u and mail.checked='0' order by mail.sendTime desc";
        Query query = getSession().createQuery(hql);
        query.setParameter("u", user);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public List<Mail> getReadedMail(User user) {
        String hql = "from Mail as mail where mail.recvUser=:u and mail.checked='1' order by mail.sendTime desc";
        Query query = getSession().createQuery(hql);
        query.setParameter("u", user);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }
}
