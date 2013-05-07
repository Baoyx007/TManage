/**
 *
 */
package edu.ahut.dao;

import edu.ahut.domain.Admin;
import edu.ahut.domain.User;
import java.util.Map;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserDao {

    public void addAdmin(Admin admin);

    public void addUser(User user);

    public User findUser(String loginName, String password);

    //第一个key是teacher，
    //第二个key是student
    public Map<String, User> findUserBySubjectId(String id);
}
