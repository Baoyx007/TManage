/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.domain.Admin;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.Map;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 25, 2013
 */
public class UserDaoHibImpl extends BasicDaoHibImpl<User> implements UserDao {

    @Override
    public void addUser(User user) {
        Session s = HibernateUtil.getCurrentSession();
        s.save(user);
    }

    @Override
    public User findUser(String username, String password) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from User as u where u.username = :username and u.password=:password");
        query.setString("username", username);
        query.setString("password", password);

        return (User) query.uniqueResult();
    }

    @Override
    public User findUser(int id, boolean full) {
        Session s = HibernateUtil.getCurrentSession();
        User u = (User) s.get(User.class, id);
        if (full) {
            if (u instanceof Student) {
                Student student = (Student) u;
//                Hibernate.initialize(student.getUnit());
//                Hibernate.initialize(student.getQualification());
            } else if (u instanceof Teacher) {
                Teacher teacher = (Teacher) u;
//                Hibernate.initialize(teacher.getUnit());
//                Hibernate.initialize(teacher.getQualification());
            }
        }
        return u;
    }

    @Override
    public Map<String, User> findUserBySubjectId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void fillPhoto(String id, String photo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addStudent(Student student) {
        Session s = HibernateUtil.getCurrentSession();
        s.saveOrUpdate(student.getQualification());
        s.saveOrUpdate(student.getUnit());
        s.save(student);
    }

    @Override
    public User findUser(String username) {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from User as u where u.username = :username ");
        query.setString("username", username);

        return (User) query.uniqueResult();
    }

    @Override
    public void addAdmin(Admin admin) {
        Session s = HibernateUtil.getCurrentSession();
        s.save(admin);
    }

    @Override
    public User loadAllInfo(User user) {
        return findUser(user.getId(), true);
    }
}
