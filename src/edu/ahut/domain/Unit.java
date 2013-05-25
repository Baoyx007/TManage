/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

/**
 * 所属单位，学校，院，系，班级
 *
 * @author Haven
 * @date May 5, 2013
 */
public class Unit {

    private int id;
    private String school;
    private String college;
    private String department;
    private String calss;

    public Unit() {
    }

    public Unit(String school, String college, String department, String calss) {
        this.school = school;
        this.college = college;
        this.department = department;
        this.calss = calss;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCalss() {
        return calss;
    }

    public void setCalss(String calss) {
        this.calss = calss;
    }
}
