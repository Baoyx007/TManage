/**
 *
 */
package edu.ahut.service.impl;

import java.util.List;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.ThesisDao;
import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.dao.impl.SubjectDaoImpl;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectServiceImpl implements SubjectService {

    SubjectDao subjectdao = DaoFactory.getSubjectDao();
    UserDao useDao = DaoFactory.getUserDao();
    ThesisDao thesisDao = DaoFactory.getThesisDao();

    @Override
    public void addSubject(String title, String description, String sId) {
        SubjectDao dao = new SubjectDaoImpl();
        Subject subject = new Subject();
        subject.setId(ServiceUtils.generateID());
        subject.setTitle(title);
        subject.setDescription(description);
        subject.setTeacherId(sId);
        dao.addSubject(subject);
    }

    /*
     * 
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.SubjectService#listAllSubject()
     */
    @Override
    public List<Subject> listAllSubject() {
        //操作3个表，这个对象应该缓存

        //其中包含的对象还没赋值
        List<Subject> subjects = subjectdao.getAllSubject();

        for (Subject subject : subjects) {
            Teacher teacher = useDao.findTeacher(subject.getTeacherId());
            Student findStudent = useDao.findStudent(subject.getStudentId());
            subject.setTeacher(teacher);
            subject.setStudent(findStudent);
            subject.setTheses(thesisDao.getThesesBySbId(subject.getId()));
        }
        return subjects;
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.SubjectService#selectSubject(java.lang.String,
     * edu.ahut.domain.User)
     */
    @Override
    public void selectSubject(String subjectId, User user) {
        new SubjectDaoImpl().selectSubject(subjectId, user.getId());
    }


    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.SubjectService#getSubject(java.lang.String)
     */
    @Override
    public Subject getSubject(String subjectId) {
        Subject subject = subjectdao.getSubjectByid(subjectId);

        subject.setTeacher(useDao.findTeacher(subject.getTeacherId()));
        subject.setStudent(useDao.findStudent(subject.getStudentId()));
        subject.setTheses(thesisDao.getThesesBySbId(subject.getId()));

        return subject;
    }
}
