/**
 *
 */
package edu.ahut.domain;

import java.util.Date;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class Thesis {

    private int id;
    private String realFileName;
    private String uuidFileName;
    private String realFilePath;
    private Date submitDate;
    private String studentComment;
    private String teacherComment;
    private Subject subject;

    public Thesis() {
        super();
    }

    public Thesis(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public String getRealFilePath() {
        return realFilePath;
    }

    public void setRealFilePath(String realFilePath) {
        this.realFilePath = realFilePath;
    }

    /**
     * @return the realFileName
     */
    public String getRealFileName() {
        return realFileName;
    }

    /**
     * @param realFileName the realFileName to set
     */
    public void setRealFileName(String realFileName) {
        this.realFileName = realFileName;
    }

    /**
     * @return the uuidFileName
     */
    public String getUuidFileName() {
        return uuidFileName;
    }

    /**
     * @param uuidFileName the uuidFileName to set
     */
    public void setUuidFileName(String uuidFileName) {
        this.uuidFileName = uuidFileName;
    }

    /**
     * @return the submitDate
     */
    public Date getSubmitDate() {
        return submitDate;
    }

    /**
     * @param submitDate the submitDate to set
     */
    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    /**
     * @return the subject
     */
    public Subject getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    /**
     * @return the studentComment
     */
    public String getStudentComment() {
        return studentComment;
    }

    /**
     * @param studentComment the studentComment to set
     */
    public void setStudentComment(String studentComment) {
        this.studentComment = studentComment;
    }

    /**
     * @return the teacherComment
     */
    public String getTeacherComment() {
        return teacherComment;
    }

    /**
     * @param teacherComment the teacherComment to set
     */
    public void setTeacherComment(String teacherComment) {
        this.teacherComment = teacherComment;
    }
}
