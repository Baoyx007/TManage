/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.MailDao;
import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import edu.ahut.exceptions.DaoException;
import edu.ahut.utils.JdbcUtils;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailDaoImpl implements MailDao {

    @Override
    public void saveMail(Mail mail) {
        String sql = "insert into mail(id,recv_id,send_id,topic,content) values(?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        try {
            runner.update(sql, mail.getId(), mail.getRecvUser().getId(), mail.getSendUser().getId(), mail.getTopic(), mail.getContent());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DaoException(e);
        }
    }

    @Override
    public List<Mail> getAllMail(User user) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select id as id,topic as topic,content as content,send_time as sendTime from mail where recv_id=? order by send_time desc";
        try {
            return runner.query(sql, new BeanListHandler<Mail>(Mail.class), user.getId());
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public List<Mail> getUnreadMail(User user) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select id as id,topic as topic,content as content,send_time as sendTime from mail where recv_id=? and checked<>1 order by send_time desc";
        try {
            return runner.query(sql, new BeanListHandler<Mail>(Mail.class), user.getId());
        } catch (SQLException e) {
            throw new DaoException(e);
        }
    }
}
