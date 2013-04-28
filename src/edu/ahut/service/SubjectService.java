/**
 * 
 */
package edu.ahut.service;

import java.util.Map;

import edu.ahut.domain.Subject;
import edu.ahut.domain.User;

/**
 * @author Haven
 * @date 2013-4-2
 * 
 */
public interface SubjectService {
    // ��ʦ���һ��������Ŀ
    public void addSubject(String title, String description, String sId);

    // �쿴����������Ŀ�Ͷ�Ӧ����ʦ��
    public Map<Subject, String> listAllSubject();

    // ѧ��ѡ����Ŀ
    public void selectSubject(String subjectId, User user);

    /**
     * @param subjectId
     * @return
     */
    public Subject getSubject(String subjectId);
    
}
