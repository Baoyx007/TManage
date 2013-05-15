<%-- 
    Document   : list_bulletin
    Created on : May 14, 2013, 9:57:38 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body >
        <h1 align="center">公告列表</h1>
        <hr>

        <c:forEach items="${requestScope.bulletins }" var="bulletin">
            <div style="margin:10px auto 10px 450px" >
                <a href="${pageContext.servletContext.contextPath}/ShowBulletionUIServlet?id=${bulletin.id}"> ${bulletin.topic}</a>
                <span style="font-size: 11px; color: grey;" >  <fmt:formatDate type="date"   value="${bulletin.time}" /></span>
                <br>
            </div>
        </c:forEach>

    </body>
</html>
