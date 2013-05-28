/**
 *
 */
package edu.ahut.service.impl;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.ThesisDao;
import edu.ahut.dao.UserDao;
import java.util.List;

import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.domain.User;
import edu.ahut.service.ThesisService;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ThesisServiceImpl implements ThesisService {

    private ThesisDao thesisDao = DaoFactory.getThesisDao();
    private SubjectDao subjectDao = DaoFactory.getSubjectDao();
    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.ThesisService#addThesis(edu.ahut.domain.Thesis,
     * edu.ahut.domain.User)
     */

    @Override
    public void addThesis(Thesis thesis, User user) {
        //学生只能选一个论文
        Subject subject = subjectDao.findSubjectByStudent((Student) user);
        thesis.setSubject(subject);
        thesisDao.addThesis(thesis);
    }

    @Override
    public List<Thesis> getThesesBySubject(Subject subject) {
        return thesisDao.getThesesBySubject(subject);
    }
}
