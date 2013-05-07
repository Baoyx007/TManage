/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserService {

    public void register(User user);

    public User login(String loginName, String password);

    public User findTeacher(String id);

    public User findStudent(String id);
}
