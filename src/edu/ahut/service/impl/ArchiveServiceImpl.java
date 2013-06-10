/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.ArchiveDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;
import edu.ahut.service.ArchiveService;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public class ArchiveServiceImpl extends BasicServiceImpl<Archive> implements ArchiveService {

    private ArchiveDao archiveDao = null;

    public ArchiveServiceImpl() {
        archiveDao = DaoFactory.getArchiveDao();
        basicDao = archiveDao;
    }

    @Override
    public void saveOrUpdateThesis(int thesisId) {
        Thesis thesis = DaoFactory.getThesisDao().getById(thesisId);
        Archive findBySubject = archiveDao.findBySubject(thesis.getSubject());
        if (findBySubject == null) {
            //不存在
            Archive archive = new Archive();
            archive.setThesis(thesis);
            archive.setSubject(thesis.getSubject());
            archiveDao.save(archive);
        } else {
            //已存在
            findBySubject.setThesis(thesis);
            archiveDao.update(findBySubject);
        }
    }

    @Override
    public boolean idArchived(String thesisId) {
        return archiveDao.isArchived(new Thesis(Integer.parseInt(thesisId)));
    }

    @Override
    public Thesis getArchiveThesisBySubjcet(Subject subject) {
        return archiveDao.getArchiveThesisBySubjcet(subject);
    }

    @Override
    public Archive getByStudent(Student student) {
        Subject studentChoosenedSubject = DaoFactory.getSubjectDao().getStudentChoosenedSubject(student);
        return archiveDao.findBySubject(studentChoosenedSubject);
    }
}
