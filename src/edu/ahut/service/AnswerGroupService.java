/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.AnswerGroup;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import java.util.List;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public interface AnswerGroupService extends BasicService<AnswerGroup> {

    //每组对应的学生
    //groupCount:每组多少人
    public void setRandomGroups();

    public AnswerGroup getGroupByUser(User user);

    public List<Archive> startAnswer(Teacher teacher);
}
