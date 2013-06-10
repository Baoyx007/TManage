/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.Journal;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 31, 2013
 */
public interface JournalService extends BasicService<Journal> {

    public List<Journal> listJournalByStudent(Student student);

    public List<Journal> getUnreadedJournal(Teacher teacher);
}
