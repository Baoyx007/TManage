/**
 *
 */
package edu.ahut.service.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.User;
import edu.ahut.service.UserService;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class UserServiceImpl implements UserService {

    UserDao userDao = DaoFactory.getUserDao();
    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#login(java.lang.String,
     * java.lang.String)
     */

    @Override
    public User login(String loginName, String password) {
        if (ServiceUtils.checkStringParam(loginName, password)) {
            return userDao.findUser(loginName, password);
        } else {
            throw new IllegalArgumentException("参数不能为空");
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.UserService#register(edu.ahut.domain.User)
     */
    @Override
    public void register(User user) {
        if (user != null) {
            userDao.addUser(user);
        }
    }

    @Override
    public User findTeacher(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User findStudent(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
