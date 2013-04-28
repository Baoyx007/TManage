/**
 * 
 */
package edu.ahut.service;

import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-3-20
 * 
 */
public interface UserService {

    public void register(User user);

    /**
     * @param loginName
     * @param password
     * @param role
     * @return
     */
    public User login(String loginName, String password, String role);

    public Teacher findTeacher(String id);

    public Student findStudent(String id);
}
