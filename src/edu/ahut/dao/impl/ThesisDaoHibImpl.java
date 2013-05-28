/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.ThesisDao;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.utils.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 26, 2013
 */
public class ThesisDaoHibImpl implements ThesisDao {

    @Override
    public void addThesis(Thesis thesis) {
        Session s = HibernateUtil.getCurrentSession();
        s.saveOrUpdate(thesis.getSubject());
        s.save(thesis);
    }

    @Override
    public void addForeignKey(Thesis thesis, String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Thesis getThesis(int id) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Thesis as t where t.id=:id");
        query.setInteger("id", id);
        return (Thesis) query.uniqueResult();
    }

    @Override
    public List<Thesis> getThesesBySubject(Subject subject) {
        Session s = HibernateUtil.getSession();
        Query query = s.createQuery(
                "from Thesis as t where t.subject=:subject");
        query.setParameter("subject", subject);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }
}
