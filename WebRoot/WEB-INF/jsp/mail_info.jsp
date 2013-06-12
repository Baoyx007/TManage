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
        <title>邮件</title>
        <meta charset="utf-8">
        <meta name="description" content="毕设">
        <meta name="author" content="haven">
        <!-- Le styles -->
        <link href="./css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            .help-block{
                color: red;
            }
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
    </head>
    <body >
        <div class="container"> 
            <div class="page-header">
                <h1>${mail.topic} &nbsp;<small>${mail.sendTime}</small></h1>
            </div>
            <span class="label label-info">发件人:</span>&nbsp;<a href="${myContext}/UserInfoServlet?userId=${mail.sendUser.id}">${mail.sendUser.name}</a>
            <hr>
            <span class="label label-info">收件人:</span>&nbsp;<a href="${myContext}/UserInfoServlet?userId=${mail.recvUser.id}">${mail.recvUser.name}</a>
            <hr>
            <div  name="content">${mail.content}</div>
            <br> 
            <a class="btn" href="${pageContext.servletContext.contextPath}/ListMailServlet" >返回</a>
        </div>

        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>
