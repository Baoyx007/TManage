/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.SubjectDao;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 26, 2013
 */
public class SubjectDaoHibImpl extends BasicDaoHibImpl<Subject> implements SubjectDao {

    @Override
    public void addSubject(Subject subject) {
        Session s = HibernateUtil.getCurrentSession();
        s.save(subject);
    }

    @Override
    public List<Subject> getAllSubject() {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Subject");
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public void selectSubject(Student student, Teacher teacher, Subject subject) {
        if (subject.getStudent() == null) {
            subject.setStudent(student);
        }
        if (subject.getTeacher() == null) {
            subject.setTeacher(teacher);
        }
        Session s = HibernateUtil.getCurrentSession();
        s.saveOrUpdate(subject);
    }

    @Override
    public List<Subject> findSubjectByStudent(Student student) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Subject as sb where sb.student=:student");
        query.setParameter("student", student);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return query.list();
    }

    @Override
    public User getTeacherByStudent(User user) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Subject as sb where sb.student=:student");
        query.setParameter("student", user);
        Subject subject = (Subject) query.uniqueResult();
        Hibernate.initialize(subject.getTeacher());
        return subject.getTeacher();
    }

    @Override
    public Subject getStudentChoosenedSubject(Student student) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Subject as sb where sb.student=:student and sb.choosened=1");
        query.setParameter("student", student);
        query.setFirstResult(0);
        query.setMaxResults(20);
        return (Subject) query.uniqueResult();
    }
}
