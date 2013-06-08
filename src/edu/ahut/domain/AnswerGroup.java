/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

import java.util.Date;
import java.util.List;

/**
 * 答辩组
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public class AnswerGroup {

    private int id;
    //多对多的关系
    private int sequence;
    private List<Student> students;
    private List<Teacher> teachers;
    //主答辩老师，管理员设置
    private Teacher master;
    private Date startTime;

    public AnswerGroup() {
    }

    public AnswerGroup(int id) {
        this.id = id;
    }

    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    public Teacher getMaster() {
        return master;
    }

    public void setMaster(Teacher master) {
        this.master = master;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
}
