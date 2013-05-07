/**
 *
 */
package edu.ahut.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import edu.ahut.dao.SubjectDao;
import edu.ahut.domain.Subject;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectDaoImpl implements SubjectDao {

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.SubjectDao#addSubject(edu.ahut.domain.Subject)
     */
    @Override
    public void addSubject(Subject subject) {
        String sql = "insert into subject(id,title,description,tid) values(?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(
                    sql,
                    new Object[]{subject.getId(), subject.getTitle(),
                subject.getDescription(), subject.getTeacher().getId()});
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.SubjectDao#getAllSubject()
     */
    @Override
    public List<Subject> getAllSubject() {
        String sql = "select id,title,description from subject";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql,
                    new BeanListHandler<Subject>(Subject.class));

        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.SubjectDao#chooseSubject(java.lang.String,
     * java.lang.String)
     */
    @Override
    public void selectSubject(String subjectId, String studentId) {
        String sql = "update subject set sid=? where id=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(sql, new Object[]{studentId, subjectId});
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.SubjectDao#findSubjectBySid(java.lang.String)
     */
    @Override
    public Subject findSubjectBySid(String sid) {
        String sql = "select id,title,description,sid as studentId,tid as teacherId from subject where sid=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<Subject>(Subject.class),
                    sid);
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.SubjectDao#getSubjectByid(java.lang.String)
     */
    @Override
    public Subject getSubjectByid(String id) {
        String sql = "select id,title,description,sid as studentId,tid as teacherId from subject where id=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<Subject>(Subject.class),
                    id);
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }
    }
}
