/**
 * 
 */
package edu.ahut.dao;

import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-3-20
 * 
 */
public interface UserDao {
    public void addUser(User user);

    public <T extends User> User findUser(String loginName, String password,
	    Class<T> clazz);

    public Teacher findTeacher(String id);

    public Student findStudent(String id);
}
