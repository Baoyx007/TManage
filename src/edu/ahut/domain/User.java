/**
 *
 */
package edu.ahut.domain;

import java.util.Date;

/**
 * @author Haven
 * @date 2013-3-19
 *
 */
public class User {
    // 基本信息

    private String id;
    private String name;
    private Date birthday;
    private Gender gender;
    // 登陆信息
    private String password;
    private String username;
    // 通讯
    private String email;
    private String phone;
    private String address;
    // 图片位置
    private String photo;
    // 自我介绍
    private String comment;
    //----------------------
    private Role role;

    public User(String id, String name, String password, String username) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.username = username;
    }

    public User(String id, String name, Date birthday, Gender gender,
            String password, String username) {
        super();
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.password = password;
        this.username = username;
    }

    public User() {
        super();

    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setRole(String role) {
        if (role.equalsIgnoreCase(Role.MANAGER.toString())) {
            this.role = Role.MANAGER;
        } else if (role.equalsIgnoreCase(Role.STUDENT.toString())) {
            this.role = Role.STUDENT;
        } else if (role.equalsIgnoreCase(Role.TEACHER.toString())) {
            this.role = Role.TEACHER;
        } else if (role.equalsIgnoreCase(Role.SUPER.toString())) {
            this.role = Role.SUPER;
        } else {
            throw new IllegalArgumentException("role is wrong!!" + role);
        }
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * @param photo the photo to set
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the gender
     */
    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        if (gender.equals(Gender.MALE.toString())) {
            this.gender = Gender.MALE;
        } else {
            this.gender = Gender.FEMALE;
        }
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

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("id:").append(this.getId()).append("\n");
        sb.append("name:").append(this.getName()).append("\n");
        sb.append("birthday:").append(this.getBirthday()).append("\n");
        sb.append("gender:").append(this.getGender()).append("\n");
        sb.append("password:").append(this.getPassword()).append("\n");
        sb.append("username:").append(this.getUsername()).append("\n");
        return sb.toString();
    }
}
