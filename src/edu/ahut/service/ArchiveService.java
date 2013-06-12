/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.Archive;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public interface ArchiveService extends BasicService<Archive> {

    public void saveOrUpdateThesis(int thesisId);

    public boolean idArchived(String thesisId);

    public Thesis getArchiveThesisBySubjcet(Subject subject);

    public Archive getByStudent(Student student);

    public Archive getBySubject(String subjectId);
}
