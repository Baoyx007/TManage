/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.ArchiveDao;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public class ArchiveDaoHibImpl extends BasicDaoHibImpl<Archive> implements ArchiveDao {

    @Override
    public Archive findByThesis(Thesis thesis) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery("from Archive as a where a.thesis=:thesis");
        query.setParameter("thesis", thesis);
        return (Archive) query.uniqueResult();
    }

    @Override
    public boolean isArchived(Thesis thesis) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery("select a.id from Archive as a where a.thesis=:thesis");
        query.setParameter("thesis", thesis);
        Object uniqueResult = query.uniqueResult();
        if (uniqueResult != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Thesis getArchiveThesisBySubjcet(Subject subject) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery("select a.thesis from Archive as a where a.subject=:subject");
        query.setParameter("subject", subject);
        return (Thesis) query.uniqueResult();
    }

    @Override
    public Archive findBySubject(Subject subject) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery("from Archive as a where a.subject=:subject");
        query.setParameter("subject", subject);
        return (Archive) query.uniqueResult();
    }
//    @Override
//    public List<Archive> findByStudents(List<Student> students) {
//        Session s = HibernateUtil.getCurrentSession();
//        Query query = s.createQuery("from Archive as a where a.student=:student");
//        ArrayList<Archive> arrayList = new ArrayList<Archive>();
//        for (Iterator<Student> it = students.iterator(); it.hasNext();) {
//            Student student = it.next();
//            query.setParameter("student", student);
//            arrayList.add((Archive) query.uniqueResult());
//        }
//        return arrayList;
//    }
}
