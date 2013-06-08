<%-- 
    Document   : answer_manage
    Created on : Jun 8, 2013, 12:09:24 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        答辩开始时间: ${answerStart}<br>
        答辩每组人数:  ${groupCount}<br>
        每次答辩持续时间:  ${answerDuration}<br>
        <hr>
        <c:forEach var="group" items="${findAll}">
            组id：${group.sequence},,,,,<a href="${myContext}/SetMasterServlet?id=${group.id}">设置主答辩老师</a><br>
            组开始时间： <fmt:formatDate type="date" dateStyle="default"  value="${group.startTime}"/><br>
            组主答辩老师：${group.master.name}<br>
            <c:forEach items="${group.students}" var="s">
                学生：${s.name}
            </c:forEach>
            <br>
            <c:forEach items="${group.teachers}" var="t">
                老师：${t.name}
            </c:forEach>
            <br>
        </c:forEach>
        <a href="getRandomGroup">自动产生答辩组</a><br>
    </body>
</html>
