/**
 *
 */
package edu.ahut.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import edu.ahut.dao.UserDao;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class UserDaoJdbcImpl implements UserDao {

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.UserDao#addUser(edu.ahut.domain.User)
     */
    @Override
    public void addUser(User user) {
        String sql = "insert into manager(id,name,birthday,gender,username,password) values(?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(
                    sql,
                    new Object[]{user.getId(), user.getName(),
                new java.sql.Date(user.getBirthday().getTime()),
                user.getGender(), user.getUsername(),
                ServiceUtils.md5(user.getPassword())});
        } catch (SQLException e) {

            e.printStackTrace();
            throw new DaoException(e);
        }

    }

    /*
     * //TODO 增加了复用性，却减少了可扩展性！！
     * 
     * @see edu.ahut.dao.UserDao#findUser(java.lang.String, java.lang.String,
     * java.lang.Class)
     */
    @Override
    public <T extends User> User findUser(String loginName, String password,
            Class<T> clazz) {
        String sql = "select id,name,birthday,gender,username,password from "
                + clazz.getSimpleName().toLowerCase()
                + " where username=? and password=?";

        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            T user = runner.query(sql, new BeanHandler<T>(clazz), loginName,
                    ServiceUtils.md5(password));
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.UserDao#findTeacher(java.lang.String)
     */
    @Override
    public Teacher findTeacher(String id) {
        String sql = "select * from teacher where id=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<Teacher>(Teacher.class),
                    id);
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see edu.ahut.dao.UserDao#findStudent(java.lang.String)
     */
    @Override
    public Student findStudent(String id) {
        String sql = "select * from student where id=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<Student>(Student.class),
                    id);
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }
}
