/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.Admin;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserService {

    public void register(User user);

    public User login(String username, String password);

//包括包涵的类
    public User getUserFullInfo(int id);

    public void update(User user);

    public User getUserById(int id);
}
