/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.utils;

import java.io.Serializable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * 单例模式
 *
 * @author Haven
 * @date May 20, 2013
 */
public final class HibernateUtil {

    private static SessionFactory sessionFactory;
    private static ThreadLocal<Session> session = new ThreadLocal<Session>();

    private HibernateUtil() {
    }

    static {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public static Session getThreadLocalSession() {
        Session s = session.get();
        if (s == null) {
            s = getSession();
            session.set(s);
        }
        return s;
    }

    public static Session getCurrentSession() {
        Session s = sessionFactory.getCurrentSession();
        if (s == null) {
            s = getSession();
        }
        return s;
    }

    public static void closeSession() {
        Session s = session.get();
        if (s != null) {
            s.close();
            session.set(null);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }

    public static void add(Object entity) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Transaction tx = s.beginTransaction();
            s.save(entity);
            tx.commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    public static void update(Object entity) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Transaction tx = s.beginTransaction();
            s.update(entity);
            tx.commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    public static void delete(Object entity) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Transaction tx = s.beginTransaction();
            s.delete(entity);
            tx.commit();
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }

    public static Object get(Class clazz, Serializable id) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            return s.get(clazz, id);
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }
}