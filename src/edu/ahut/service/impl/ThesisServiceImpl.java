/**
 *
 */
package edu.ahut.service.impl;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.ThesisDao;
import java.util.List;

import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.Thesis;
import edu.ahut.service.ThesisService;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ThesisServiceImpl extends BasicServiceImpl<Thesis> implements ThesisService {

    private ThesisDao thesisDao;
    private SubjectDao subjectDao;

    public ThesisServiceImpl() {
        subjectDao = DaoFactory.getSubjectDao();
        thesisDao = DaoFactory.getThesisDao();
        basicDao = thesisDao;
    }
    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.ThesisService#addThesis(edu.ahut.domain.Thesis,
     * edu.ahut.domain.User)
     */

//    @Override
//    public void addThesis(Thesis thesis, User user) {
//        Subject subject = subjectDao.getStudentChoosenedSubject((Student) user);
//        thesis.setSubject(subject);
//        thesisDao.addThesis(thesis);
//    }
    @Override
    public List<Thesis> getThesesBySubject(Subject subject) {
        return thesisDao.getThesesBySubject(subject);
    }

//    @Override
//    public void teacherUpdateThesis(Thesis thesis,Subject subject) {
//        
//    }
    @Override
    public List<Thesis> getUnreadedThesises(Teacher teacher) {
        ArrayList<Thesis> arrayList = new ArrayList<Thesis>();
        //        teacher ->subject
        List<Subject> findSubjectByTeacher = subjectDao.findSubjectByTeacher(teacher);
        //        subject ->un thesis
        for (Iterator<Subject> it = findSubjectByTeacher.iterator(); it.hasNext();) {
            Subject subject = it.next();
            List<Thesis> unreadedThesises = thesisDao.getUnreadedThesises(subject);
            arrayList.addAll(unreadedThesises);
        }
        return arrayList;
    }
}
