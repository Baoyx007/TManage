<%-- 
    Document   : mail_info
    Created on : May 29, 2013, 4:48:23 PM
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
    <body style="width: 60%">
        发件人:${mail.sendUser.name}
        <hr>
        收件人:${mail.recvUser.name}
        <hr>
        主题：<strong>${mail.topic}</strong>——${mail.sendTime}
        <hr>
        <div id="content" name="content" contenteditable="false" >${mail.content}</div>
        <script>
            CKEDITOR.disableAutoInline = true;
            CKEDITOR.inline('content');
        </script>
        <br> 
        <a href="${pageContext.servletContext.contextPath}/ListMailServlet" >返回</a>
    </body>
</html>
