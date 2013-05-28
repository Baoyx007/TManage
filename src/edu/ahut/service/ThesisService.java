/**
 *
 */
package edu.ahut.service;

import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import java.util.List;

import edu.ahut.domain.Thesis;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public interface ThesisService {

    public void addThesis(Thesis thesis, User user);

    public List<Thesis> getThesesBySubject(Subject subject);
}
