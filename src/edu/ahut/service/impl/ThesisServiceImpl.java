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
        
        //FIXME ���ص�Ӧ����Ψһ�ģ�����Ҫ��tid!=null!!!
	Subject subject = sDao.findSubjectBySid(user.getId());

	// �о��д������ڴ��˷ѣ���Ϊ�ܶ��ò�����ÿ�ζ���newһ������
	// addThesis����ֻҪsubject��ID���˷�!
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
