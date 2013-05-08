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
            return userDao.findUser(loginName, ServiceUtils.md5(password));
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
            //FIXME 先判断用户是否已存在
            userDao.addUser(user);
        }
    }

    @Override
    public User getUserFullInfo(String id) {
        return userDao.fillUnit(userDao.fillQualification(userDao.findUser(id)));
    }

    @Override
    public User fillUnit(User user) {
        return userDao.fillUnit(user);
    }

    @Override
    public User fillQualification(User user) {
        return userDao.fillQualification(user);
    }

    @Override
    public User fillAllInfo(User user) {
        if (user.getUnit() == null) {
            user = userDao.fillUnit(user);
        }
        if (user.getQualification() == null) {
            user = userDao.fillQualification(user);
        }
        return user;
    }

    @Override
    public User getUserById(String id) {
        return userDao.findUser(id);
    }
}
