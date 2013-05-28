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
        private String name;${thisUser.name}<br>
        <!--    // 登陆信息，，，，要被设置
            private String password;
            private String username;-->
        // 通讯<br>
        private String email;${thisUser.email}<br>
        private String phone;${thisUser.phone}<br>
        // 自我介绍<br>
        private String comment;${thisUser.comment}<br>
        <hr>
        user info<更多信息><br>
        private String schoolNumber;${thisUser.schoolNumber}<br>
        private Date birthday;${thisUser.birthday}<br>
        private Gender gender;${thisUser.gender}<br>
        // 通讯地址<br>
        private String address;${thisUser.address}<br>
        // 图片位置<br>
        <a href="UploadPhotoUIServlet">photo</a>;
        <c:choose >
            <c:when test="${thisUser.photo==null}"> 
                <img src="img/${thisUser.gender}.png" width="150" height="200"/></c:when>
            <c:otherwise>
                <img src="ShowPhotoUIServlet?param=${thisUser.photo}"  width="150" height="200"/>
            </c:otherwise>
        </c:choose>
        <br>
        <hr>
        //应该直接显示基本信息，有个按钮：详细信息
        //以下是对象类型<br>
        <%--
             private Unit unit;<br>
             --
             private int id;${thisUser.unit.id}<br>
             private String school;${thisUser.unit.school}<br>
             private String college;${thisUser.unit.college}<br>
             private String department;${thisUser.unit.department}<br>
             private String calss;${thisUser.unit.calss}<br>

        private Qualification qualification;<br>
        --
        private int id;${thisUser.qualification.id}<br>
        private String college;${thisUser.qualification.college}<br>
        private String degree;${thisUser.qualification.degree}<br>
        private int duration;${thisUser.qualification.duration}<br>
        private Date year;${thisUser.qualification.year}<br> --%>
    </body>
</html>
