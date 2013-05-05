/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

/**
 * 管理者，包括：系统管理者，超管，答辩管理
 *
 * @author Haven
 * @date May 5, 2013
 */
public class Admin {

    private String id;
    private String name;
    // 登陆信息
    private String password;
    private String username;
    // 通讯
    private String email;
    private String phone;
    // 自我介绍
    private String comment;
    //----------------------
    private Role role;

    public Admin() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
}
