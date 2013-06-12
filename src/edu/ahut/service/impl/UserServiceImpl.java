/**
 *
 */
package edu.ahut.service.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import edu.ahut.service.UserService;
import edu.ahut.utils.ServiceUtils;
import java.util.List;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class UserServiceImpl extends BasicServiceImpl<User> implements UserService {

    private UserDao userDao = null;

    public UserServiceImpl() {
        userDao = DaoFactory.getUserDao();
        basicDao = userDao;
    }

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
            User findUser = userDao.findUser(user.getUsername());
            if (findUser != null) {
                throw new IllegalArgumentException("用户名重复");
            }
            userDao.addUser(user);
        }
    }

    @Override
    public User getUserFullInfo(int id) {
        return userDao.findUser(id, true);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User getUserById(int id) {
        return userDao.getById(id);
    }

    @Override
    public List<Student> getAllStudents() {
        return userDao.getAllStudents();
    }

    @Override
    public int getAllStudentCount() {
        long i = userDao.getAllStudentCount();
        return (int) i;
    }
}
