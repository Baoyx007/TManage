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
    private String email;
    private String phone;
    private String comment;
    private String userType;
    private String name;
    private String schoolNumber;
    private String address;
    private String qulif;
    private String unit;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getSchoolNumber() {
        return schoolNumber;
    }

    public void setSchoolNumber(String schoolNumber) {
        this.schoolNumber = schoolNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQulif() {
        return qulif;
    }

    public void setQulif(String qulif) {
        this.qulif = qulif;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public void setGender(String gender) {
        if ("MALE".equals(gender)) {
            this.gender = Gender.MALE;
        } else {
            this.gender = Gender.FEMALE;
        }
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

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
        } else if (!password.trim().matches(".{3,50}")) {
            // System.out.println(password.trim());
            isOK = false;
            errors.put("password", "密码必须是3-50位");
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
            errors.put("name", "姓名不能为空");
        } else if (!name.matches("^[\u4e00-\u9fa5]+$")) {
            isOK = false;
            errors.put("name", "姓名不是汉字");
        }

        return isOK;

    }
}
