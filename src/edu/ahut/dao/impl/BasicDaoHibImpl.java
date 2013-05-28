/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao.impl;

import edu.ahut.dao.BasicDao;
import edu.ahut.utils.HibernateUtil;
import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Haven
 * @date May 28, 2013
 */
public class BasicDaoHibImpl<T> implements BasicDao<T> {

    protected Class<T> clazz; // 这是一个问题！

    public BasicDaoHibImpl() {
        // 通过反射得到T的真实类型
        ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
        this.clazz = (Class) pt.getActualTypeArguments()[0];

//        System.out.println("clazz = " + clazz.getName());
    }

    protected Session getSession() {
        return HibernateUtil.getCurrentSession();
    }

    @Override
    public void save(T entity) {
        getSession().save(entity);
    }

    @Override
    public void update(T entity) {
        getSession().update(entity);
    }

    @Override
    public void delete(Integer id) {
        Object obj = getSession().get(clazz, id);
        getSession().delete(obj);
    }

    @Override
    public T getById(Integer id) {
        if (id <= 0) {
            return null;
        }
        return (T) getSession().get(clazz, id);
    }

    @Override
    public List<T> getByIds(Integer[] ids) {
        if (ids == null || ids.length == 0) {
            return Collections.EMPTY_LIST;
        }

        return getSession().createQuery(//
                "FROM " + clazz.getSimpleName() + " WHERE id IN(:ids)")//
                .setParameterList("ids", ids)//
                .list();
    }

    @Override
    public List<T> findAll() {
        return getSession().createQuery(//
                "FROM " + clazz.getSimpleName())//
                .list();
    }
}
