/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.AnswerGroupDao;
import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.AnswerGroup;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.service.AnswerGroupService;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class AnswerGroupServiceImpl extends BasicServiceImpl<AnswerGroup> implements AnswerGroupService {

    private AnswerGroupDao answerGroupDao = null;

    public AnswerGroupServiceImpl() {
        answerGroupDao = DaoFactory.getAnswerGroupDao();
        basicDao = answerGroupDao;
    }

    @Override
    public void setRandomGroups(int groupStudents) {
        answerGroupDao.clearDate();
        UserDao userDao = DaoFactory.getUserDao();
        Random random = new Random(System.currentTimeMillis());
        int nextInt;

        List<Student> allStudents = userDao.getAllStudents();
        long studentCount = userDao.getAllStudentCount();
        int tempCount = (int) studentCount;
        Date startTime = new Date();
        //gCount 有多少组
        int gCount = (int) (Math.floor(studentCount / groupStudents) + 1);

        for (int i = 0; i < gCount; i++) {
            AnswerGroup answerGroup = new AnswerGroup();
            List<Student> group = new ArrayList<Student>();
            for (int j = 0; tempCount > 0 && j < groupStudents; j++) {
                nextInt = random.nextInt(tempCount);
                Student student = allStudents.get(nextInt);
                group.add(student);
                student.setAnswerGroup(answerGroup);
                allStudents.remove(student);
                tempCount -= 1;
            }
            answerGroup.setSequence(i + 1);
            answerGroup.setStudents(group);
            answerGroupDao.save(answerGroup);
            List<Teacher> teachersByStudents = DaoFactory.getSubjectDao().getTeachersByStudents(group);
            for (Iterator<Teacher> it = teachersByStudents.iterator(); it.hasNext();) {
                Teacher teacher = it.next();
                teacher.setAnswerGroup(answerGroup);
            }
            answerGroup.setTeachers(DaoFactory.getSubjectDao().getTeachersByStudents(group));
            //FIXME 组数*组人*一次时间
//            setStartTime(i + 1,groupStudents,30, Calendar.getInstance().);
//            answerGroup.setStartTime(new Date(startTime.getTime()+groupStudents*30*60*1000*i));
            answerGroupDao.update(answerGroup);
        }
    }
}
