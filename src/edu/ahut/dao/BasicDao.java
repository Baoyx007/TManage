package edu.ahut.dao;

import java.util.List;

public interface BasicDao<T> {

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
//	/**
//	 * 公共的查询分页信息的方法
//	 * 
//	 * @param pageNum
//	 * @param hqlHelper
//	 *            查询条件（HQL语句与参数列表）
//	 * @return
//	 */
//	PageBean getPageBean(int pageNum, HqlHelper hqlHelper);
}
