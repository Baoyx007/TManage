/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.ahut.service;

import java.util.List;

/**
 *
 * @author Haven
 * @date May 29, 2013
 */
public interface BasicService<T> {
 /**
     * 保存实体
     *
     * @param entity
     */
    void save(T entity);

    /**
     * 删除实体
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 更新实体
     *
     * @param entity
     */
    void update(T entity);

    /**
     * 查询实体，如果id为null，则返回null，并不会抛异常。
     *
     * @param id
     * @return
     */
    public T getById(Integer id);

    /**
     * 查询实体
     *
     * @param ids
     * @return
     */
    public List<T> getByIds(Integer[] ids);

    /**
     * 查询所有
     *
     * @return
     */
    List<T> findAll();
}
