/**
 *
 */
package edu.ahut.domain;

import java.util.Date;

/**
 * 用户和管理员都是人，所以可以继承<br>
 * 权限管理通过role
 *
 * @author Haven
 * @date 2013-3-19
 *
 */
public class User extends Admin {
    // 基本信息

    private String schoolNumber;
    private Date birthday;
    private Gender gender;
    // 通讯地址
    private String address;
    // 图片位置
    private String photo;
    //学生，还是教授
    private String title;
    //以下是对象类型
    private Unit unit;
    private Qualification qualification;

    public User() {
    }

    public User(String id) {
        super(id);
    }

    public User(String id, Role role) {
        super(id, role);
    }

    public String getSchoolNumber() {
        return schoolNumber;
    }

    public void setSchoolNumber(String schoolNumber) {
        this.schoolNumber = schoolNumber;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(String gender) {
      
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public Qualification getQualification() {
        return qualification;
    }

    public void setQualification(Qualification qualification) {
        this.qualification = qualification;
    }
}
