/**
 * 
 */
package edu.ahut.domain;

/**
 * 论文选题,包涵题目，老师、学生的ID，对此描述。
 * 
 * @author Haven
 * @date 2013-4-2
 * 
 */
public class Subject {
    private String id;
    private String title;
    private String description;

    // TODO 这应该是Teacher，Student，这两个类，以后改！！
    private String studentId;
    private String teacherId;

    /**
     * @return the id
     */
    public String getId() {
	return id;
    }

    /**
     * @param id
     *            the id to set
     */
    public void setId(String id) {
	this.id = id;
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
     * @return the description
     */
    public String getDescription() {
	return description;
    }

    /**
     * @param description
     *            the description to set
     */
    public void setDescription(String description) {
	this.description = description;
    }

    /**
     * @return the studentId
     */
    public String getStudentId() {
	return studentId;
    }

    /**
     * @param studentId
     *            the studentId to set
     */
    public void setStudentId(String studentId) {
	this.studentId = studentId;
    }

    /**
     * @return the teacherId
     */
    public String getTeacherId() {
	return teacherId;
    }

    /**
     * @param teacherId
     *            the teacherId to set
     */
    public void setTeacherId(String teacherId) {
	this.teacherId = teacherId;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
	StringBuilder sb = new StringBuilder();
	sb.append(" id : " + this.id);
	sb.append(", title : " + this.title);
	sb.append(", description : " + this.description);
	sb.append(", studentId : " + this.studentId);
	sb.append(", teacherId : " + this.teacherId);
	return sb.toString();
    }

}
