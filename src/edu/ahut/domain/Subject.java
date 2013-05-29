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

    private int id;
    private String title;
    private String description;
    private Student student;
    private Teacher teacher;
//    被管理员check过
    private boolean checked;
    //学生老师已确定！
    private boolean choosened;
    //-------
    private List<Thesis> theses;

    public Subject() {
    }

    public Subject(int id) {
        this.id = id;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isChoosened() {
        return choosened;
    }

    public void setChoosened(boolean choosened) {
        this.choosened = choosened;
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Thesis> getTheses() {
        return theses;
    }

    public void setTheses(List<Thesis> theses) {
        this.theses = theses;
    }
}
