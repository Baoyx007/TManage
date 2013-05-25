<%-- 
    Document   : SendMail
    Created on : May 19, 2013, 5:49:00 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
        <script src="js/ckeditor/ckeditor.js"></script>
    </head>
    <body >
        发件人:${sessionScope.user.name}
        <hr>
        收件人:${toUser.name}
        <hr>
        <form method="post" action="${pageContext.servletContext.contextPath }/SendMailServlet"> 主题：<input type="text" name="topic"/>
            <hr>
            <textarea id="content" name="content" contenteditable="true" ></textarea>
            <script>
                CKEDITOR.replace('content');
            </script>
            <input type="hidden" name="toUserId" value="${toUser.id}"> 
            <br>  <input type="submit" value="提交">
        </form>
    </body>
</html>
