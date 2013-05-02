/**
 * 
 */
package edu.ahut.service;


import edu.ahut.domain.Subject;
import edu.ahut.domain.User;
import java.util.List;

/**
 * @author Haven
 * @date 2013-4-2
 * 
 */
public interface SubjectService {
    // ��ʦ���һ��������Ŀ
    public void addSubject(String title, String description, String sId);

    // �쿴����������Ŀ�Ͷ�Ӧ����ʦ��
    public List<Subject> listAllSubject();

    // ѧ��ѡ����Ŀ
    public void selectSubject(String subjectId, User user);

    /**
     * @param subjectId
     * @return
     */
    public Subject getSubject(String subjectId);
    
}
