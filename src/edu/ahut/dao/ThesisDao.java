/**
 * 
 */
package edu.ahut.dao;

import java.util.List;

import edu.ahut.domain.Thesis;

/**
 * @author Haven
 * @date 2013-4-5
 * 
 */
public interface ThesisDao {
    // 初次增加论文
    public void addThesis(Thesis thesis);

    // 增加外键
    public void addForeignKey(Thesis thesis, String key);

    public Thesis getThesis(String id);

    /**
     * 根据subjectID得到thesis
     * 获取数据库所有列
     * @param sbId subjectId
     * 
     * @return
     */
    List<Thesis> getThesesBySbId(String sbId);

}
