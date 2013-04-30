/**
 *
 */
package edu.ahut.domain;

import java.util.List;

/**
 * @author Haven
 * @date 2013-3-19
 *
 */
public class Student extends User {
    // 学院

    private String college;
    // 专业
    private String major;
    // 班级
    private String stuClass;
    // 学制
    private int courseYear;
    // 入学年份
    private int enterYear;
    // 学历
    private String degree;
    //------------
    private List<Subject> subjects;

    public Student() {
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    /**
     * @return the college
     */
    public String getCollege() {
        return college;
    }

    /**
     * @param college the college to set
     */
    public void setCollege(String college) {
        this.college = college;
    }

    /**
     * @return the major
     */
    public String getMajor() {
        return major;
    }

    /**
     * @param major the major to set
     */
    public void setMajor(String major) {
        this.major = major;
    }

    /**
     * @return the stuClass
     */
    public String getStuClass() {
        return stuClass;
    }

    /**
     * @param stuClass the stuClass to set
     */
    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    /**
     * @return the courseYear
     */
    public int getCourseYear() {
        return courseYear;
    }

    /**
     * @param courseYear the courseYear to set
     */
    public void setCourseYear(int courseYear) {
        this.courseYear = courseYear;
    }

    /**
     * @return the enterYear
     */
    public int getEnterYear() {
        return enterYear;
    }

    /**
     * @param enterYear the enterYear to set
     */
    public void setEnterYear(int enterYear) {
        this.enterYear = enterYear;
    }

    /**
     * @return the degree
     */
    public String getDegree() {
        return degree;
    }

    /**
     * @param degree the degree to set
     */
    public void setDegree(String degree) {
        this.degree = degree;
    }
}
