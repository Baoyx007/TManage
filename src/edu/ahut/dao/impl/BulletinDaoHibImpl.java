/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.BulletinDao;
import edu.ahut.domain.Bulletin;
import edu.ahut.domain.User;
import edu.ahut.utils.HibernateUtil;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 26, 2013
 */
public class BulletinDaoHibImpl implements BulletinDao {

    @Override
    public void saveBulletin(Bulletin bulletin) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            s.beginTransaction();
            s.save(bulletin);
            s.getTransaction().commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public List<Bulletin> getAllBulletin() {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Query query = s.createQuery(
                    "from Bulletin as b order by b.time desc ");
            //第一条记录,分页
            query.setFirstResult(0);
            //多少条记录
            query.setMaxResults(20);
            return query.list();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    @Override
    public Bulletin fillAdmin(Bulletin bulletin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Bulletin getBulletinById(int id) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Bulletin b = (Bulletin) s.get(Bulletin.class, id);
            //把admin加上了!
            Hibernate.initialize(b.getAdmin());
            return b;
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }
}
