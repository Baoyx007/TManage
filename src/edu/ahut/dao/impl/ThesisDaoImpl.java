/**
 *
 */
package edu.ahut.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import edu.ahut.dao.ThesisDao;
import edu.ahut.domain.Thesis;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ThesisDaoImpl implements ThesisDao {

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.ThesisDao#addThesis(edu.ahut.domain.Thesis)
     */
    @Override
    public void addThesis(Thesis thesis) {
        String sql = "INSERT INTO thesis(id,real_file_name,uuid_file_name,submit_date,stu_comment,subject_id) VALUES(?,?,?,?,?,?)";

        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(sql, thesis.getId(), thesis.getRealFileName(), thesis
                    .getUuidFileName(), new java.sql.Timestamp(thesis
                    .getSubmitDate().getTime()), thesis.getStudentComment(),
                    thesis.getSubject().getId());
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.ThesisDao#addForeignKey(edu.ahut.domain.Thesis,
     * java.lang.String)
     */
    @Override
    public void addForeignKey(Thesis thesis, String key) {
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.ThesisDao#getThesis(java.lang.String)
     */
    @Override
    public List<Thesis> getThesesBySbId(String sbId) {
        String sql = "select id,real_file_name as realFileName,uuid_file_name as uuidFileName,"
                + "submit_date as submitDate,stu_comment as studentComment,"
                + "tea_comment as teacherComment,subject_id as subjectId from thesis where subject_id=? order by submit_date desc";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanListHandler<Thesis>(Thesis.class),
                    sbId);
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.ThesisDao#getThesis(java.lang.String)
     */
    @Override
    public Thesis getThesis(String id) {
        // TODO subject√ª∑®”≥…‰
        return null;
    }
}
