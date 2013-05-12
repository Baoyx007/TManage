<%-- 
    Document   : user_info
    Created on : May 8, 2013, 9:19:36 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        admin info<基本信息>:<br>
        private String name;${user.name}<br>
        <!--    // 登陆信息，，，，要被设置
            private String password;
            private String username;-->
        // 通讯<br>
        private String email;${user.email}<br>
        private String phone;${user.phone}<br>
        // 自我介绍<br>
        private String comment;${user.comment}<br>
        private Role role;${user.role}<br>
        <hr>
        user info<更多信息><br>
        private String schoolNumber;${user.schoolNumber}<br>
        private Date birthday;${user.birthday}<br>
        private Gender gender;${user.gender}<br>
        // 通讯地址<br>
        private String address;${user.address}<br>
        // 图片位置<br>
        private String photo;
        <c:if test="${user.photo==null}">
            <img src="img/${user.gender}.png"/>
        </c:if>
        <br>
        //学生，还是教授<br>
        private String title;${user.title}<br>
        <hr>
        //以下是对象类型<br>
        private Unit unit;<br>
        --
        private int id;${user.unit.id}<br>
        private String school;${user.unit.school}<br>
        private String college;${user.unit.college}<br>
        private String department;${user.unit.department}<br>
        private String calss;${user.unit.calss}<br>

        private Qualification qualification;<br>
        --
        private int id;${user.qualification.id}<br>
        private String college;${user.qualification.college}<br>
        private String degree;${user.qualification.degree}<br>
        private int duration;${user.qualification.duration}<br>
        private Date year;${user.qualification.year}<br>
    </body>
</html>
