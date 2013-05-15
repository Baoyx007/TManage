/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.BulletinDao;
import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

/**
 *
 * @author Haven
 * @date May 14, 2013
 */
public class BulletinDaoImpl implements BulletinDao {

    @Override
    public void saveBulletin(Bulletin bulletin) {
        String sql = "insert into bulletin(id,topic,time,content,attachment,admin_id) values(?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(sql, bulletin.getId(), bulletin.getTopic(), bulletin.getTime(),
                    bulletin.getContent(), bulletin.getAttachment(), bulletin.getAdmin().getId());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public List<Bulletin> getAllBulletin() {
        String sql = "select * from bulletin";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanListHandler<Bulletin>(Bulletin.class));
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public Bulletin fillAdmin(Bulletin bulletin) {
        String sql = "select * from admin where id=(select admin_id from bulletin where id=?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            Admin admin = runner.query(sql, new BeanHandler<Admin>(Admin.class), bulletin.getId());
            bulletin.setAdmin(admin);
            return bulletin;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public Bulletin getBulletinById(String id) {
        String sql = "select * from bulletin where id=?";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            return runner.query(sql, new BeanHandler<Bulletin>(Bulletin.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }
}
