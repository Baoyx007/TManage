<%-- 
    Document   : systemConfig
    Created on : Jun 3, 2013, 12:21:11 AM
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
        <form action="${myContext}/SetSystemConfigServlet" method="post">
            选题开放时间:  <input type="text" name="thesisStart" value="${thesisStart}"/><br>
            选题结束时间:  <input type="text" name="thesisEnd" value="${thesisEnd}"/><br>
            答辩开始时间:  <input type="text" name="answerStart" value="${answerStart}"/><br>
            答辩每组人数:  <input type="text" name="groupCount" value="${groupCount}"/><br>
            每次答辩持续时间:  <input type="text" name="answerDuration" value="${answerDuration}"/><br>
            <input type="submit" value="提交">
        </form>

        <a href="javascript:history.go(-1);">向上一页</a>
    </body>
</html>
