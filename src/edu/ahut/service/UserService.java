/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import java.util.List;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserService extends BasicService<User> {

    public void register(User user);

    public User login(String username, String password);

//包括包涵的类
    public User getUserFullInfo(int id);

    public User getUserById(int id);

    public List<Student> getAllStudents();

    public int getAllStudentCount();

    public User getAdmin();
}
