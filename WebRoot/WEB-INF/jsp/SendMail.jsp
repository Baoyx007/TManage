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
        <title>发送邮件</title>
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
        <div class="page-header">
            <h1>发送邮件</h1>
        </div>
        <div class="container">
            <form method="post" action="${pageContext.servletContext.contextPath }/SendMailServlet"> 主题：<input type="text" name="topic"/><br>
                <span class="label label-info">发件人:</span>&nbsp; <a href="${myContext}/UserInfoServlet?userId=${sessionScope.user.id}">${sessionScope.user.name}</a>
                <hr>
                <span class="label label-info">收件人:</span>&nbsp;
                <c:if test="${toUser != null}">
                    <a href="${myContext}/UserInfoServlet?userId=${toUser.id}">${toUser.name}</a>
                    <input type="hidden" name="toUserId" value="${toUser.id}"> 
                </c:if>
                <c:if test="${students!=null}">
                    <select name="toStudent">
                        <c:forEach items="${students}" var="student">
                            <option value="${student.id}">${student.name}</option>
                        </c:forEach>
                    </select>
                </c:if>
                <hr>
                <textarea style="width: 441px; height: 152px;"name="content" contenteditable="true" ></textarea>

                <br>  <input class="btn btn-primary" type="submit" value="提交">
            </form>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>
