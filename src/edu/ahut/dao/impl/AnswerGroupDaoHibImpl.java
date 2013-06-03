/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.AnswerGroupDao;
import edu.ahut.domain.AnswerGroup;
import edu.ahut.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class AnswerGroupDaoHibImpl extends BasicDaoHibImpl<AnswerGroup> implements AnswerGroupDao {

    @Override
    public void clearDate() {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "delete  from  AnswerGroup");
        query.executeUpdate();
    }
}
