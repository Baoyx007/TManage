/**
 *
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.UserDao;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import java.util.Map;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
@Deprecated
public class UserDaoJdbcImpl implements UserDao {
//
//    /*
//     * 
//     * @see edu.ahut.dao.UserDao#addUser(edu.ahut.domain.User)
//     */
//    @Override
//    public void addUser(User user) {
//        String sql = "insert into user(id,school_number,name,birthday,gender,username,password,"
//                + "email,phone,address,photo,comment,title,role,unit_id,qualification_id) "
//                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(
//                    sql, user.getId(), user.getSchoolNumber(), user.getName(),
//                    new java.sql.Date(user.getBirthday().getTime()),
//                    user.getGender().toString(), user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone(), user.getAddress(), user.getPhoto(), user.getComment(), user.getTitle(), user.getRole().toString(), user.getUnit().getId(), user.getQualification().getId());
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public void addAdmin(Admin_bak admin) {
//        String sql = "insert into admin(id,name,username,password,email,phone,comment,role) values(?,?,?,?,?,?,?,?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(sql, admin.getId(), admin.getName(),
//                    admin.getUsername(), admin.getPassword(), admin.getEmail(),
//                    admin.getPhone(), admin.getComment(), admin.getRole().toString());
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public User findUser(String loginName, String password) {
//        String sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
//                + ",email,phone,address,photo,comment,title,role from user where username=? and password=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<User>(User.class), loginName, password);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public User findUser(String id) {
//        String sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
//                + ",email,phone,address,photo,comment,title,role from user where id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<User>(User.class), id);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public Map<String, User> findUserBySubjectId(String id) {
//        HashMap<String, User> users = new HashMap<String, User>();
//        //student
//        String sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
//                + ",email,phone,address,photo,comment,title,role from user where "
//                + "id = (SELECT teacher_id FROM subject where id=?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//
//        try {
//            users.put("teacher", runner.query(sql, new BeanHandler<User>(User.class), id));
//            //teacher
//            sql = "select id,school_number as schoolNumber,name,birthday,gender,username,password"
//                    + ",email,phone,address,photo,comment,title,role from user where "
//                    + "id = (SELECT student_id FROM subject where id=?)";
//            users.put("student", runner.query(sql, new BeanHandler<User>(User.class), id));
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDaoJdbcImpl.class.getName()).log(Level.SEVERE, null, ex);
//            throw new DaoException(ex);
//        }
//        return users;
//    }
//
//    @Override
//    public User fillUnit(User user) {
//        String sql = "select id as id,school as school,college as college,department as department,class as calss from unit "
//                + " where id=(select unit_id from user where user.id = ?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            Unit query = runner.query(sql, new BeanHandler<Unit>(Unit.class), user.getId());
//            user.setUnit(query);
//            return user;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public User fillQualification(User user) {
//        String sql = "select id as id,college as college,degree as degree,duration as duration,start_time as year  from qualification "
//                + " where id=(select qualification_id from user where user.id = ?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            Qualification query = runner.query(sql, new BeanHandler<Qualification>(Qualification.class), user.getId());
//            user.setQualification(query);
//            return user;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public void fillPhoto(String id, String photo) {
//        String sql = "update user set photo=? where id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(sql, photo, id);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public Admin_bak findAdmin(String loginName, String password) {
//        String sql = "select * from admin where username=? and password=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<Admin_bak>(Admin_bak.class), loginName, password);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public Admin_bak findAdmin(String id) {
//        String sql = "select * from admin where id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<Admin_bak>(Admin_bak.class), id);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }

    @Override
    public void addStudent(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User findUser(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User findUser(String username, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Map<String, User> findUserBySubjectId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User fillUnit(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User fillQualification(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void fillPhoto(String id, String photo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
