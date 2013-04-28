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
    // 老师添加一个论文题目
    public void addSubject(String title, String description, String sId);

    // 察看所有论文题目和对应个老师名
    public Map<Subject, String> listAllSubject();

    // 学生选择题目
    public void selectSubject(String subjectId, User user);

    /**
     * @param subjectId
     * @return
     */
    public Subject getSubject(String subjectId);
    
}
