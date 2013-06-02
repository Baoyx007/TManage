/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 * 答辩安排： 一个${时间}，从￥{开始}到￥{结束} 1个学生5个老师看，自己导师不评价自己的
 * 一上午，一组，5个老师，一次30min，8-11：30，可答辩7个学生！
 *
 * 随机产生答辩，7个学生一组，该组除了答辩学生的老师外，其他老师参加，不足的从其他组随机抽取，多的随机抽取，
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class Dabian {
//    private int subjectCount等于学生数

    private static int subjectCount = 76;
    private static int studentCount = 76;
    private static int teacherCount = 24;

    public static void main(String[] args) {
        List<String> students = new LinkedList<String>();
        List<String> teachers = new LinkedList<String>();
        int i = 0;
        int j = 0;
        int nextInt = 0;
        for (i = 0; i < subjectCount; i++) {
            students.add("s" + i);
        }
        for (i = 0; i < teacherCount; i++) {
            teachers.add("t" + i);
        }
        Random random = new Random(System.currentTimeMillis());

        int gCount = getGroupCount();
        int tempCount = subjectCount;
        HashMap<Integer, ArrayList<String>> stuGroup = new HashMap<Integer, ArrayList<String>>();
        for (i = 0; i < gCount; i++) {
            ArrayList<String> group = new ArrayList<String>();
            for (j = 0; tempCount > 0 && j < 7; j++) {
                nextInt = random.nextInt(tempCount);
                String get = students.get(nextInt);
                group.add(get);
                students.remove(get);
                tempCount -= 1;
            }
            stuGroup.put(i, group);
        }
        //已获取每组对应7个学生了
        //        for (Map.Entry<Integer, ArrayList<String>> entry : stuGroup.entrySet()) {
        //            Integer integer = entry.getKey();
        //            ArrayList<String> arrayList = entry.getValue();
        //            System.out.println("------------");
        //            System.out.println(arrayList);
        //        }

//        下面获得每组5个老师，1.随机性，2.自己老师不检查自己学生

        //获得每一组的老师
        HashMap<Integer, List<String>> teacherGroup = new HashMap<Integer, List<String>>();
        for (i = 0; i < gCount; i++) {
            List<String> teachersByStudentGroup = getTeachersByStudentGroup(stuGroup.get(i));
            teacherGroup.put(1, teachersByStudentGroup);
        }

        HashMap<Integer, List<String>> connectGroup = new HashMap<Integer, List<String>>();
        //遍历组
        for (i = 0; i < gCount; i++) {
            //遍历一组7个人
            for (j = 0; j < 7; j++) {
                //第几组，第几个stuGroup.get(i).get(j)
                String teachersByStudent = getTeachersByStudent(stuGroup.get(i).get(j));
                //拷贝一份teacherGroup
                List<String> subList = teacherGroup.get(i).subList(0, teacherGroup.size());
                //先去本学生的老师
                subList.remove(teachersByStudent);
                if (subList.size() == 5) {
                    //正好：5个老师，无需从其他组选
                    connectGroup.put(7 * i + j, subList);
                    continue;
                } else if ((subList.size() > 5)) {
                    //多:随机去除多的
                    nextInt = random.nextInt(subList.size() - 5);
                    subList = subList.subList(nextInt, nextInt + 5);
                    connectGroup.put(7 * i + j, subList);
                    continue;
                } else {
                    //少：从剩余的随机选几个
                    int left = 5 - subList.size();
                    while (left > 0) {
                        nextInt = random.nextInt(teacherCount);
                        String get = teachers.get(nextInt);
                        if (!get.equals(teachersByStudent)
                                && subList.contains(get) == false) {
                            subList.add(get);
                            left--;
                        }
                    }
                    connectGroup.put(7 * i + j, subList);
                    continue;
                }
            }
        }
    }

    //包涵多少个上午,多少组
    static int getGroupCount() {
        return (int) (Math.floor(76 / 7) + 1);
    }

    static List<String> getTeachersByStudentGroup(List<String> ids) {
        return null;
    }

    static String getTeachersByStudent(String id) {
        return null;
    }
}
