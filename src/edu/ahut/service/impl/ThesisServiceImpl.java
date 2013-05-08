/**
 * 
 */
package edu.ahut.service.impl;

import java.util.List;

import edu.ahut.dao.SubjectDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.dao.impl.SubjectDaoImpl;
import edu.ahut.dao.impl.ThesisDaoImpl;
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

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.ThesisService#addThesis(edu.ahut.domain.Thesis,
     * edu.ahut.domain.User)
     */
    @Override
    public void addThesis(Thesis thesis, User user) {
	SubjectDao sDao = new SubjectDaoImpl();
        
        //FIXME 返回的应该是唯一的，所以要求tid!=null!!!
	Subject subject = sDao.findSubjectBySid(user.getId());

	// 感觉有大量的内存浪费，因为很多用不到，每次都是new一个对象
	// addThesis可能只要subject的ID，浪费!
	thesis.setSubject(subject);
	new ThesisDaoImpl().addThesis(thesis);
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.service.ThesisService#getThesisBySid(java.lang.String)
     */
    @Override
    public List<Thesis> getThesesBySbId(String sbId) {
	return DaoFactory.getThesisDao().getThesesBySbId(sbId);
    }

}
