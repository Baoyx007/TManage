/**
 * 
 */
package edu.ahut.domain;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public class Teacher extends User {
    // ѧԺ
    private String college;
    // ϵ
    private String faculty;
    // ְ��
    private String title;
    // ��У���
    private int enterYear;
    // ѧ��
    private String degree;

    /**
     * @return the college
     */
    public String getCollege() {
	return college;
    }

    /**
     * @param college
     *            the college to set
     */
    public void setCollege(String college) {
	this.college = college;
    }

    /**
     * @return the title
     */
    public String getTitle() {
	return title;
    }

    /**
     * @param title
     *            the title to set
     */
    public void setTitle(String title) {
	this.title = title;
    }

    /**
     * @return the enterYear
     */
    public int getEnterYear() {
	return enterYear;
    }

    /**
     * @param enterYear
     *            the enterYear to set
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
     * @param degree
     *            the degree to set
     */
    public void setDegree(String degree) {
	this.degree = degree;
    }

    /**
     * @return the faculty
     */
    public String getFaculty() {
	return faculty;
    }

    /**
     * @param faculty
     *            the faculty to set
     */
    public void setFaculty(String faculty) {
	this.faculty = faculty;
    }
}
