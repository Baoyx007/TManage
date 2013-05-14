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

    public User login(String loginName, String password);

    public Admin adminLogin(String loginName, String password);

    public User getUserById(String id);

//包括包涵的类
    public User getUserFullInfo(String id);

    public User fillUnit(User user);

    public User fillQualification(User user);

    public User fillAllInfo(User user);

    public void fillPhoto(String id, String photo);
}
