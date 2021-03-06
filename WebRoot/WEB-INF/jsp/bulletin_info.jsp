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
    </head>
    <body >
        <div class="container">
            <div class="page-header">
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
            </div>
            <div class="row-fluid">
                <div class="span12" >
                    ${bulletin.content}
                </div>
            </div>
            <div class="row-fluid">
                附件：${bulletin.attachment}
            </div>
            <a href="javascript:history.go(-1);">返回</a>
            <c:choose >
                <%-- for preview --%>
                <c:when test="${sessionScope.user!=null and requestScope.preview==true}"><a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">修改</a>，<a href="${pageContext.servletContext.contextPath}/SubmitBulletinServlet">提交</a></c:when>
                <%-- for admin --%>
                <c:when test="${sessionScope.user!=null }"><a href="${MyContext}/PublishBulletinUIServlet">修改??</a></c:when>
            </c:choose> 
        </div>
        <script src="./js/jquery.js"></script>
    </body>
</html>
