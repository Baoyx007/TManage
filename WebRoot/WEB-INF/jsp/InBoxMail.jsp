<%-- 
    Document   : InBoxMail
    Created on : May 19, 2013, 10:55:31 PM
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
        <div>未读</div>
        <hr>
        ${unreadList}
        <div>已读</div>
        <hr>
        //显示20个
        ${mailList}
    </body>
</html>
