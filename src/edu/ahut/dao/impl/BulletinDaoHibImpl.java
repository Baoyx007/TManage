/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.BulletinDao;
import edu.ahut.domain.Bulletin;
import edu.ahut.utils.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 26, 2013
 */
public class BulletinDaoHibImpl extends BasicDaoHibImpl<Bulletin> implements BulletinDao {
    
    @Override
    public void saveBulletin(Bulletin bulletin) {
//        try {
//            s.beginTransaction();
        HibernateUtil.getCurrentSession().save(bulletin);
//            s.getTransaction().commit();
//        } finally {
//            if (s != null) {
//                s.close();
//            }
//        }
    }
    
    @Override
    public List<Bulletin> getAllBulletin() {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Bulletin as b order by b.time desc ");
        //第一条记录,分页
        query.setFirstResult(0);
        //多少条记录
        query.setMaxResults(20);
        return query.list();
    }
    
    @Override
    public Bulletin fillAdmin(Bulletin bulletin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Bulletin getBulletinById(int id) {
        Session s = HibernateUtil.getSession();
        Bulletin b = (Bulletin) s.get(Bulletin.class, id);
        return b;
    }
    
    @Override
    public List<Bulletin> getTop2() {
        Session s = HibernateUtil.getCurrentSession();
        Query query = s.createQuery(
                "from Bulletin as b order by b.time desc ");
        query.setFirstResult(0);
        query.setMaxResults(2);
        return query.list();
    }
}
