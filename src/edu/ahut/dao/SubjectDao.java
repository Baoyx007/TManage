/**
 * 
 */
package edu.ahut.dao;

import java.util.List;

import edu.ahut.domain.Subject;

/**
 * @author Haven
 * @date 2013-4-2
 * 
 */
public interface SubjectDao {
    public void addSubject(Subject subject);

    // ������Ͷ�Ӧ�ķ�����
    public List<Subject> getAllSubject();

    /**
     * ѧ��ѡ����Ŀ
     * 
     * @param subjectId
     *            ��Ŀid
     * @param studentId
     *            ѧ��id
     * */
    public void selectSubject(String subjectId, String studentId);

    /**
     * ����ѧ��ID������Ŀ һ��ѧ��ֻ�ܶ�Ӧһ��subject *
     * 
     * @param id
     * @return
     */
    public Subject findSubjectBySid(String id);

    /**
     * ����id���subject
     * 
     * */
    public Subject getSubjectByid(String id);
}
