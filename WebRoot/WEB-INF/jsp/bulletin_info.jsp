<%-- 
    Document   : bulletin_info
    Created on : May 13, 2013, 9:13:09 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>公告</title>   
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
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">

        <script src="/ckeditor/ckeditor.js"></script>
    </head>
    <body >
        <div class="container">
            <div class="row-fluid">
                <div class="span12">
                    <h3 class="text-center">
                        ${bulletin.topic}
                    </h3> 
                    <div class="text-center">
                        <span class="label badge-info ">时间</span>
                        <fmt:formatDate type="both" dateStyle="default" timeStyle="default" value="${bulletin.time}"/>
                        &nbsp;&nbsp;&nbsp;
                        <span class="label badge-success">来源</span>${bulletin.admin.name}
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12" id="content" contenteditable="false">
                    ${bulletin.content}
                </div>
                <script>
                    // Turn off automatic editor creation first.
                    CKEDITOR.disableAutoInline = true;
                    CKEDITOR.inline('content');
                </script>
            </div>
            <div class="row-fluid">
                附件：${bulletin.attachment}
            </div>
            <c:choose >
                <%-- for preview --%>
                <c:when test="${sessionScope.user!=null and requestScope.preview==true}"><a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">修改</a>，<a href="${pageContext.servletContext.contextPath}/SubmitBulletinServlet">提交</a></c:when>
                <%-- for user --%>
                <c:when test="${sessionScope.user!=null}">返回</c:when>
                <%-- for admin --%>
                <c:when test="${sessionScope.user!=null }"><a href="#">修改(还不能改)</a></c:when>
            </c:choose> 
        </div>
    </body>
</html>
