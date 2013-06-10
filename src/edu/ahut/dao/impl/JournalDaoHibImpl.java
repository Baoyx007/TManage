/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.JournalDao;
import edu.ahut.domain.Journal;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.utils.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 31, 2013
 */
public class JournalDaoHibImpl extends BasicDaoHibImpl<Journal> implements JournalDao {

    @Override
    public List<Journal> listJournalByStudent(Student student) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Journal as j where j.student=:student order by j.sumbitDate asc ");
        query.setParameter("student", student);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public List<Journal> listJournalByTeacher(Teacher teacher) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Journal as j where j.teacher=:teacher order by j.sumbitDate asc ");
        query.setParameter("teacher", teacher);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public List<Journal> listUnreadedJournalByStudent(Student student) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Journal as j where j.student=:student and j.teacher=null order by j.sumbitDate asc ");
        query.setParameter("student", student);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }
}
