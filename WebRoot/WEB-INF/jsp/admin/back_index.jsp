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
        <title>毕设管理</title>
    </head>
    <body>
        管理员界面:<br>

        <div align="right">
            欢迎你：${user.name },<a href="${pageContext.servletContext.contextPath}/servlet/RegisterUIServlet">注册用户</a>,设置,<a href="${pageContext.servletContext.contextPath}/servlet/LogoutServlet">注销</a></div>
        公告管理:  <a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">发布公告(增)</a>, 
        <a href="${pageContext.servletContext.contextPath}/ListBulletinServlet">所有公告（删，改）</a><br>
        选题管理:
        <a href="${pageContext.servletContext.contextPath}/CheckSubjectServlet">审核论题（删）</a>
        <a href="${pageContext.servletContext.contextPath}/servlet/ListSubjectServlet">已通过的论题</a>
        <input type="search" >查找论题(通过主题,查)
        <br>
        系统管设置:（一个界面，修改）
        <a href="${myContext}/SystemConfigUIServlet">毕业设计系统设置</a>
        <br>
        <a href="${myContext}/AnswerManageServlet">答辩安排</a>
        <a href="#">所有论文</a>
        <br>
        用户管理(增，删，改)

        <hr>
        测试：<br>
        管理员：${user}
        <hr>
        ${user.getClass().simpleName}
    </body>
</html>
