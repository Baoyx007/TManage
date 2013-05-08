/**
 *
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.domain.Admin;
import edu.ahut.domain.Unit;
import edu.ahut.domain.User;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class UserDaoJdbcImpl implements UserDao {

    /*
     * 
     * @see edu.ahut.dao.UserDao#addUser(edu.ahut.domain.User)
     */
    @Override
    public void addUser(User user) {
        String sql = "insert into user(id,school_number,name,birthday,gender,username,password,"
                + "email,phone,address,photo,comment,title,role,unit_id,qualification_id) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(
                    sql, user.getId(), user.getSchoolNumber(), user.getName(),
                    new java.sql.Date(user.getBirthday().getTime()),
                    user.getGender().toString(), user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone(), user.getAddress(), user.getPhoto(), user.getComment(), user.getTitle(), user.getRole().toString(), user.getUnit().getId(), user.getQualification().getId());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public void addAdmin(Admin admin) {
        String sql = "insert into admin(id,name,username,password,email,phone,comment,role) values(?,?,?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(sql, admin.getId(), admin.getName(),
                    admin.getUsername(), admin.getPassword(), admin.getEmail(),
                    admin.getPhone(), admin.getComment(), admin.getRole().toString());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public User findUser(String loginName, String password) {
        String sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
                + ",email,phone,address,photo,comment,title,role from user where username=? and password=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<User>(User.class), loginName, password);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public Map<String, User> findUserBySubjectId(String id) {
        HashMap<String, User> users = new HashMap<String, User>();
        //student
        String sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
                + ",email,phone,address,photo,comment,title,role from user where "
                + "id = (SELECT teacher_id FROM subject where id=?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

        try {
            users.put("teacher", runner.query(sql, new BeanHandler<User>(User.class), id));
            //teacher
            sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
                    + ",email,phone,address,photo,comment,title,role from user where "
                    + "id = (SELECT student_id FROM subject where id=?)";
            users.put("student", runner.query(sql, new BeanHandler<User>(User.class), id));
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoJdbcImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw new DaoException(ex);
        }
        return users;
    }

    @Override
    public User fillUnit(User user) {
        String sql = "select id as id,school as school,college as college,department as department,class as calss from unit "
                + " where id=(select unit_id from user where user.id = ?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            Unit query = runner.query(sql, new BeanHandler<Unit>(Unit.class), user.getId());
            user.setUnit(query);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public User fillQualification(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
