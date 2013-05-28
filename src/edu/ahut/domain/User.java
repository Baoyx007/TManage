/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

/**
 *
 *
 * @author Haven
 * @date May 25, 2013
 */
public abstract class User {

    private int id;
    private String name;
    // 登陆信息
    private String password;
    private String username;
    // 通讯
    private String email;
    private String phone;
    // 自我介绍
    private String comment;

    public User() {
    }

    public User(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
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
}
