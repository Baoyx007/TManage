/**
 *
 */
package edu.ahut.dao;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import java.util.List;
import java.util.Map;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public interface UserDao extends BasicDao<User> {

    //FIXME  不应该重复创建unit和qualif
    public void addStudent(Student student);

    public void addAdmin(Admin admin);
//
//    public Admin findAdmin(String username, String password);
//
//    public Admin findAdmin(String id);

    public void addUser(User user);

    public User findUser(String username, String password);

    public User findUser(int id, boolean full);

    public User findUser(String username);

    //第一个key是teacher，
    //第二个key是student
    public Map<String, User> findUserBySubjectId(String id);

    public User loadAllInfo(User user);

    public void fillPhoto(String id, String photo);

    public List<Student> getAllStudents();

    public Long getAllStudentCount();
}
