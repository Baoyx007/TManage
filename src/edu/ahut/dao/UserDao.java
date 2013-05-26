/**
 *
 */
package edu.ahut.dao;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import java.util.Map;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserDao {

    //FIXME  不应该重复创建unit和qualif
    public void addStudent(Student student);

    public void addAdmin(Admin admin);
//
//    public Admin findAdmin(String username, String password);
//
//    public Admin findAdmin(String id);

    public void addUser(User user);

    public User findUser(String username, String password);

    public User findUser(int id);

    public User findUser(String username);

    //第一个key是teacher，
    //第二个key是student
    public Map<String, User> findUserBySubjectId(String id);

    public User fillUnit(User user);

    public User fillQualification(User user);

    public void fillPhoto(String id, String photo);
}
