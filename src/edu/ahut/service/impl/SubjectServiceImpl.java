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
public class SubjectServiceImpl implements SubjectService {

    SubjectDao subjectdao = DaoFactory.getSubjectDao();

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
        //操作3个表，这个对象应该缓存

        //其中包含的对象还没赋值
        List<Subject> subjects = subjectdao.getAllSubject();

//        for (Subject subject : subjects) {
//            Map<String, User> users = userDao.findUserBySubjectId(subject.getId());
//            subject.setTeacher(users.get("teacher"));
//            subject.setStudent(users.get("student"));
//            subject.setTheses(thesisDao.getThesesBySbId(subject.getId()));
//        }
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
}
