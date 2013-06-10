/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.AnswerGroupDao;
import edu.ahut.dao.UserDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.AnswerGroup;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.AnswerGroupService;
import edu.ahut.web.controller.SetSystemConfigServlet;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    //每组学生数
    //答辩开始时间
    //答辩持续时间
    public void setRandomGroups(int groupStudents, Date answerStartTime, int answerDuration) {
        answerGroupDao.clearDate();
        UserDao userDao = DaoFactory.getUserDao();
        Random random = new Random(System.currentTimeMillis());
        int nextInt;
        List<Student> allStudents = userDao.getAllStudents();
        long studentCount = userDao.getAllStudentCount();
        //学生总数
        int tempCount = (int) studentCount;
        //gCount 有多少组
        int gCount = (int) (Math.floor(studentCount / groupStudents) + 1);
        //min为单位
        int groupTime = groupStudents * answerDuration;
        int start = 0;
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
            start += groupTime;
            int day = start / 480;
            // 加day天
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(answerStartTime);
            calendar.add(Calendar.DATE, day);
            answerGroup.setStartTime(calendar.getTime());
            answerGroupDao.update(answerGroup);
        }
    }

    @Override
    public void setRandomGroups() {
        InputStream in = null;
        try {
            in = SetSystemConfigServlet.class.getClassLoader().getResourceAsStream("general.properties");
            Properties properties = new Properties();
            properties.load(in);
            String answerStart = properties.getProperty("answerStart");
            String answerDuration = properties.getProperty("answerDuration");
            String groupCount = properties.getProperty("groupCount");
            SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
            //答辩开始时间
            Date answerStartTime = formatDate.parse(answerStart);
            setRandomGroups(Integer.parseInt(groupCount), answerStartTime, Integer.parseInt(answerDuration));
        } catch (Exception e) {
            throw new RuntimeException("读取系统设置出错");
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException ex) {
                    Logger.getLogger(AnswerGroupServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public AnswerGroup getGroupByUser(User user) {
        return answerGroupDao.getGroupByUser(user);
    }

    @Override
    public List<Archive> startAnswer(Teacher teacher) {
        AnswerGroup groupByUser = answerGroupDao.getGroupByUser(teacher);
        ArrayList<Archive> arrayList = new ArrayList<Archive>();
        List<Student> students = groupByUser.getStudents();
        for (Iterator<Student> it = students.iterator(); it.hasNext();) {
            Student student = it.next();
            student.getName();
            Subject studentChoosenedSubject = DaoFactory.getSubjectDao().getStudentChoosenedSubject(student);
            Archive findBySubject = DaoFactory.getArchiveDao().findBySubject(studentChoosenedSubject);
            arrayList.add(findBySubject);
        }
        return arrayList;
    }
}
