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
    // ������������
    public void addThesis(Thesis thesis);

    // �������
    public void addForeignKey(Thesis thesis, String key);

    public Thesis getThesis(String id);

    /**
     * ����subjectID�õ�thesis
     * ��ȡ���ݿ�������
     * @param sbId subjectId
     * 
     * @return
     */
    List<Thesis> getThesesBySbId(String sbId);

}
