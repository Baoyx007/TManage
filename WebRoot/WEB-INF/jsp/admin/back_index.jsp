<%-- 
    Document   : back_index
    Created on : May 13, 2013, 8:55:26 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        管理员界面:<br>
        <a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">发布公告</a><br>
        <a href="#">所有公告</a><br>


        <hr>
        测试：<br>
        管理员：${admin}
        <hr>
    </body>
</html>
