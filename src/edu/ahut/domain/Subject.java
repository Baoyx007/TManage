/**
 *
 */
package edu.ahut.domain;

import java.util.List;

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
    //-----------
    private User student;
    private User teacher;
    private List<Thesis> theses;

    public Subject() {
    }

    public List<Thesis> getTheses() {
        return theses;
    }

    public void setTheses(List<Thesis> theses) {
        this.theses = theses;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
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
     * @param title the title to set
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
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(" id : ").append(this.id);
        sb.append(", title : ").append(this.title);
        sb.append(", description : ").append(this.description);
        sb.append(",student:").append(this.student);
        sb.append(",teacher:").append(this.teacher);
        sb.append(",theses:").append(this.theses);
        return sb.toString();
    }
}
