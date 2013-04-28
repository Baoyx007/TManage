/**
 * 
 */
package edu.ahut.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.dao.impl.SubjectDaoImpl;
import edu.ahut.dao.impl.UserDaoJdbcImpl;
import edu.ahut.domain.Subject;
import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-4-2
 * 
 */
public class SubjectServiceImpl implements SubjectService {

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
    public Map<Subject, String> listAllSubject() {
	SubjectDao subjectdao = new SubjectDaoImpl();
	UserDao useDao = new UserDaoJdbcImpl();
	List<Subject> subjects = subjectdao.getAllSubject();
	Map<Subject, String> map = new HashMap<Subject, String>();
	for (Subject subject : subjects) {
	    User teacher = useDao.findTeacher(subject.getTeacherId());
	    map.put(subject, teacher.getName());
	}

	return map;
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
	SubjectDao subjectDao = DaoFactory.getSubjectDao();
	return subjectDao.getSubjectByid(subjectId);
    }
}
