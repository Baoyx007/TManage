/**
 * 
 */
package edu.ahut.service.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.dao.impl.UserDaoJdbcImpl;
import edu.ahut.domain.Manager;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.UserService;

/**
 * @author Haven
 * @date 2013-3-20
 * 
 */
public class UserServiceImpl implements UserService {

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#login(java.lang.String,
     * java.lang.String)
     */
    @Override
    public User login(String loginName, String password, String role) {
	UserDao userDao = new UserDaoJdbcImpl();

	// 返回null是未发现
	if ("manager".equalsIgnoreCase(role)) {
	    return userDao.findUser(loginName, password, Manager.class);
	} else if ("student".equalsIgnoreCase(role)) {
	    return userDao.findUser(loginName, password, Student.class);
	} else if ("teacher".equalsIgnoreCase(role)) {
	    return userDao.findUser(loginName, password, Teacher.class);
	} else {
	    return null;
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#register(edu.ahut.domain.User)
     */
    @Override
    public void register(User user) {
	new UserDaoJdbcImpl().addUser(user);
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#findTeacher(java.lang.String)
     */
    @Override
    public Teacher findTeacher(String id) {
	return DaoFactory.getUserDao().findTeacher(id);
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#findStudent(java.lang.String)
     */
    @Override
    public Student findStudent(String id) {
	return DaoFactory.getUserDao().findStudent(id);
    }

}
