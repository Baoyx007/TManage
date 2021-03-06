/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao;

import edu.ahut.domain.Journal;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 31, 2013
 */
public interface JournalDao extends BasicDao<Journal> {

    public List<Journal> listJournalByStudent(Student student);

    public List<Journal> listUnreadedJournalByStudent(Student student);

    public List<Journal> listJournalByTeacher(Teacher teacher);
}
