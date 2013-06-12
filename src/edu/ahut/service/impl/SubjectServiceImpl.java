/**
 *
 */
package edu.ahut.service.impl;

import java.util.List;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectServiceImpl extends BasicServiceImpl<Subject> implements SubjectService {

    SubjectDao subjectdao = null;

    public SubjectServiceImpl() {
        subjectdao = DaoFactory.getSubjectDao();
        basicDao = subjectdao;
    }

    @Override
    public void addSubject(String title, String description, User teacher) {
        Subject subject = new Subject();
        subject.setTitle(title);
        subject.setDescription(description);
        subject.setTeacher((Teacher) teacher);
        subjectdao.addSubject(subject);
    }

    /*
     * 
     * 完全的subject，所有对象都包涵
     * 
     * @see edu.ahut.service.SubjectService#listAllSubject()
     */
    @Override
    public List<Subject> listAllSubject() {
        List<Subject> subjects = subjectdao.getAllSubject();

        return subjects;
    }

    @Override
    public void selectSubject(Student student, Teacher teacher, Subject subject) {
        subjectdao.selectSubject(student, teacher, subject);
    }

    @Override
    public List<Subject> findSubjectByStudent(Student student) {
        return subjectdao.findSubjectByStudent(student);
    }

    @Override
    public Subject getById(int id) {
        return subjectdao.getById(id);
    }

    @Override
    public User getTeacherByStudent(User user) {
        return subjectdao.getTeacherByStudent(user);
    }

    @Override
    public Subject getStudentChoosenedSubject(Student student) {
        return subjectdao.getStudentChoosenedSubject(student);
    }

    @Override
    public List<Subject> findSubjectByUser(User user) {
        if (user instanceof Student) {
            return subjectdao.findSubjectByStudent((Student) user);
        } else if (user instanceof Teacher) {
            return subjectdao.findSubjectByTeacher((Teacher) user);
        } //admin，可以看所有的
        else {
            return subjectdao.findAll();
        }
    }

    @Override
    public List<Subject> getUncheckedSubjects() {
        return subjectdao.getUncheckedSubjects();
    }

    @Override
    public List<Subject> getCheckedSubjects() {
        return subjectdao.getCheckedSubjects();
    }

    @Override
    public void updateSubject(int id, String title, String description, User teacher) {
        Subject subject = new Subject(id);
        subject.setTitle(title);
        subject.setDescription(description);
        subject.setTeacher((Teacher) teacher);
        subjectdao.update(subject);
    }

    @Override
    public void markAsChoosen(String subjectId) {
        Subject byId = subjectdao.getById(Integer.parseInt(subjectId));
        byId.setChoosened(true);
        subjectdao.update(byId);
    }

    @Override
    public List<Student> getStudentsByTeacher(Teacher teacher) {
        return subjectdao.getStudentsByTeacher(teacher);
    }
}
