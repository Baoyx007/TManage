/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import java.util.List;

import edu.ahut.domain.Thesis;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public interface ThesisService extends BasicService<Thesis> {

//    //只有学生能添加
//    public void addThesis(Thesis thesis, User user);
    public List<Thesis> getThesesBySubject(Subject subject);
//    public void teacherUpdateThesis(Thesis thesis, Subject subject);
    
    public List<Thesis> getUnreadedThesises(Teacher teacher);
}
