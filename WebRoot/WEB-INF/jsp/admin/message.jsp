<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>


        <title>全局消息显示页面</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">


    </head>

    <body>
        ${message }
        <br>
        管理员
        <a href="${pageContext.servletContext.contextPath}/BackIndexUIServlet" >返回首页</a>
        <a href="${pageContext.servletContext.contextPath}/LoginUIServlet" >返回登陆</a>
    </body>
</html>