/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.JournalDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Journal;
import edu.ahut.domain.Student;
import edu.ahut.service.JournalService;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 31, 2013
 */
public class JournalServiceImpl extends BasicServiceImpl<Journal> implements JournalService {

    private JournalDao journalDao = null;

    public JournalServiceImpl() {
        journalDao = DaoFactory.getJournalDao();
        basicDao = journalDao;
    }

    @Override
    public List<Journal> listJournalByStudent(Student student) {
        return journalDao.listJournalByStudent(student);
    }
}
