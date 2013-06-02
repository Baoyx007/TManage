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

        <div align="right">
            欢迎你：${user.name },<a href="${pageContext.servletContext.contextPath}/servlet/RegisterUIServlet">注册用户</a>,设置,<a href="${pageContext.servletContext.contextPath}/servlet/LogoutServlet">注销</a></div>
        <a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">发布公告</a>, 
        <a href="${pageContext.servletContext.contextPath}/ListBulletinServlet">所有公告</a><br>
        <a href="${pageContext.servletContext.contextPath}/CheckSubjectServlet">审核论题</a>
     
        <a href="">毕业设计系统设置(选题开始，结束，中期检查，查看论文)</a>
        <a href="">写到xml中？数据库中？选题开放，选题结束，答辩等时间</a>
        <br>
        <a href="">答辩安排</a>
        
        <hr>
        测试：<br>
        管理员：${user}
        <hr>
        ${user.getClass().simpleName}
    </body>
</html>
