/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 25, 2013
 */
public class UserDaoHibImpl implements UserDao {

    @Override
    public void addUser(User user) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
//            s.saveOrUpdate(user.get);
//            s.saveOrUpdate(qualification);
            s.save(user);
            s.getTransaction().commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public User findUser(String username, String password) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            Query query = s.createQuery(
                    "from User as u where u.username = :username and u.password=:password");
            query.setString("username", username);
            query.setString("password", password);

            return (User) query.uniqueResult();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public User findUser(int id) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            return (User) s.get(User.class, id);
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public Map<String, User> findUserBySubjectId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User fillUnit(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User fillQualification(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void fillPhoto(String id, String photo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addStudent(Student student) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            s.saveOrUpdate(student.getQualification());
            s.saveOrUpdate(student.getUnit());
            s.save(student);
            s.getTransaction().commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public User findUser(String username) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            Query query = s.createQuery(
                    "from User as u where u.username = :username ");
            query.setString("username", username);

            return (User) query.uniqueResult();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }
}
