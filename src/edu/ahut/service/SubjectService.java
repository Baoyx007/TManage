/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import java.util.List;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public interface SubjectService extends BasicService<Subject>{
    // 老师添加一个论文题目

    public void addSubject(String title, String description, User teacher);

    // 察看所有论文题目和对应个老师名
    public List<Subject> listAllSubject();

    // 学生选择题目
    public void selectSubject(Student student, Teacher teacher, Subject subject);

    public Subject getStudentChoosenedSubject(Student student);

    /**
     */
    public List<Subject> findSubjectByStudent(Student student);

    public Subject getById(int id);

    public User getTeacherByStudent(User user);

    //返回每个人提交的
    //admin返回所有的
    public List<Subject> findSubjectByUser(User user);
    
     public List<Subject> getUncheckedSubjects();
}
