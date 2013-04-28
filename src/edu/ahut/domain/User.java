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
public abstract class User {
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

    // 评论
    private String comment;

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

    /**
     * @return the name
     */
    public String getName() {
	return name;
    }

    /**
     * @param name
     *            the name to set
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
     * @param birthday
     *            the birthday to set
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
     * @param email
     *            the email to set
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
     * @param phone
     *            the phone to set
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
     * @param photo
     *            the photo to set
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
     * @param password
     *            the password to set
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
     * @param address
     *            the address to set
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
     * @param username
     *            the username to set
     */
    public void setUsername(String username) {
	this.username = username;
    }

    /**
     * @return the comments
     */
    public String getComments() {
	return comment;
    }

    /**
     * @param comments
     *            the comments to set
     */
    public void setComments(String comments) {
	this.comment = comments;
    }

    /**
     * @return the gender
     */
    public String getGender() {
	return gender.toString();
    }

    /**
     * @param gender
     *            the gender to set
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
     * @param id
     *            the id to set
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
	sb.append("id:" + this.getId() + "\n");
	sb.append("name:" + this.getName() + "\n");
	sb.append("birthday:" + this.getBirthday() + "\n");
	sb.append("gender:" + this.getGender() + "\n");
	sb.append("password:" + this.getPassword() + "\n");
	sb.append("username:" + this.getUsername() + "\n");
	return sb.toString();
    }

}
