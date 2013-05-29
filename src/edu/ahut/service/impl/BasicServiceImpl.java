/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.BasicDao;
import edu.ahut.service.BasicService;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 29, 2013
 */
public class BasicServiceImpl<T> implements BasicService<T> {

    protected BasicDao basicDao = null;

    @Override
    public void save(T entity) {
        basicDao.save(entity);
    }

    @Override
    public void delete(Integer id) {
        basicDao.delete(id);
    }

    @Override
    public void update(T entity) {
        basicDao.update(entity);
    }

    @Override
    public T getById(Integer id) {
        return (T) basicDao.getById(id);
    }

    @Override
    public List<T> getByIds(Integer[] ids) {
        return basicDao.getByIds(ids);
    }

    @Override
    public List<T> findAll() {
        return basicDao.findAll();
    }
}
