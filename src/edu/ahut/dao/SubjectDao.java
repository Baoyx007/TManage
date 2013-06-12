/**
 *
 */
package edu.ahut.dao;

import edu.ahut.domain.Student;
import java.util.List;

import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public interface SubjectDao extends BasicDao<Subject> {

    public void addSubject(Subject subject);

    // 论文题和对应的发布者
    public List<Subject> getAllSubject();

    /**
     * 学生选择题目
     *
     *
     */
    public void selectSubject(Student student, Teacher teacher, Subject subject);

    /**
     * 根据学生ID发现题目 一个学生只能对应一个subject <br>
     * 不成功返回null
     *
     */
    public List<Subject> findSubjectByStudent(Student student);

    public List<Subject> findSubjectByTeacher(Teacher teacher);

    public List<Subject> findChoosenSubjectByTeacher(Teacher teacher);

    public User getTeacherByStudent(User user);

    public Subject getStudentChoosenedSubject(Student student);

    /**
     * 按时间排序成队列
     */
    public List<Subject> getUncheckedSubjects();

    public List<Subject> getCheckedSubjects();

    public List<Teacher> getTeachersByStudents(List<Student> students);

    public List<Subject> getSubjectsByName(String name);

    public List<Student> getStudentsByTeacher(Teacher teacher);
}
