/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao;

import edu.ahut.domain.Archive;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Thesis;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public interface ArchiveDao extends BasicDao<Archive> {

    public Archive findByThesis(Thesis thesis);

    public Archive findBySubject(Subject subject);

    public boolean isArchived(Thesis thesis);

    public Thesis getArchiveThesisBySubjcet(Subject subject);
//    public List<Archive> findByStudents(List<Student> students);
}
