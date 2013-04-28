/**
 * 
 */
package edu.ahut.web.formbean;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import edu.ahut.domain.Gender;

/**
 * @author Haven
 * @date 2013-3-23
 * 
 */
public class RegisterForm {
    private String username;
    private String password;
    private String password2;

    private Gender gender;
    private String birthday;
    private String name;

    private String checkcode;

    private Map<String, String> errors = new HashMap<String, String>();

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
     * @return the password2
     */
    public String getPassword2() {
	return password2;
    }

    /**
     * @param password2
     *            the password2 to set
     */
    public void setPassword2(String password2) {
	this.password2 = password2;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
	return birthday;
    }

    /**
     * @param birthday
     *            the birthday to set
     */
    public void setBirthday(String birthday) {
	this.birthday = birthday;
    }

    /**
     * @return the checkcode
     */
    public String getCheckcode() {
	return checkcode;
    }

    /**
     * @param checkcode
     *            the checkcode to set
     */
    public void setCheckcode(String checkcode) {
	this.checkcode = checkcode;
    }

    /**
     * @return the errors
     */
    public Map<String, String> getErrors() {
	return errors;
    }

    /**
     * @param errors
     *            the errors to set
     */
    public void setErrors(Map<String, String> errors) {
	this.errors = errors;
    }

    public boolean validate() {
	boolean isOK = true;
	// 用户名为3-8位
	if (username == null || username.trim().equals("")) {
	    isOK = false;
	    errors.put("username", "用户名不能为空");
	} else if (!username.matches("[A-Za-z0-9]{3,8}")) {
	    isOK = false;
	    errors.put("username", "用户名必须是3-8位");
	}

	if (password == null || password.trim().equals("")) {
	    isOK = false;
	    errors.put("password", "密码不能为空");
	} else if (!password.trim().matches("[A-Za-z0-9]{3,8}")) {
	    // System.out.println(password.trim());
	    isOK = false;
	    errors.put("password", "密码必须是3-8位");
	}

	if (password2 == null || password2.trim().equals("")) {
	    isOK = false;
	    errors.put("password2", "密码不能为空");
	} else if (!password2.equals(password)) {
	    isOK = false;
	    errors.put("password2", "两次密码要一致");
	}

	// if (email == null || email.trim().equals("")) {
	// isOK = false;
	// errors.put("email", "邮箱不能为空");
	// }
	// // \w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
	// else if (!email.matches("\\w+@\\w+(\\.\\w+)+")) {
	// isOK = false;
	// errors.put("email", "邮箱格式不正确");
	// }

	if (!(birthday == null || birthday.trim().equals(""))) {
	    try {
		DateLocaleConverter dic = new DateLocaleConverter();
		dic.convert(birthday, "yyyy-MM-dd");
	    } catch (Exception e) {
		isOK = false;
		errors.put("birthday", "日期格式不正确");
	    }
	}

	// System.out.println(nickname);// ??°??? 乱码？？
	if (name == null || name.trim().equals("")) {
	    isOK = false;
	    errors.put("name", "昵称不能为空");
	} else if (!name.matches("^[\u4e00-\u9fa5]+$")) {
	    isOK = false;
	    errors.put("name", "昵称不是汉字");
	}

	return isOK;

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
}
