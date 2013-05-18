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

    // 论文题和对应的发布者
    public List<Subject> getAllSubject();

    /**
     * 学生选择题目
     *
     * @param subjectId 题目id
     * @param studentId 学生id
     *
     */
    public void selectSubject(String subjectId, String studentId);

    /**
     * 根据学生ID发现题目 一个学生只能对应一个subject <br>
     * 不成功返回null
     *
     * @param id
     * @return
     */
    public Subject findSubjectBySid(String id);

    /**
     * 根据id获得subject
     *
     *
     */
    public Subject getSubjectByid(String id);
}
