<%-- 
    Document   : answer_info
    Created on : Jun 8, 2013, 3:39:19 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>答辩</title>
    </head>
    <body>
        组次：${group.sequence}<br>
        开始时间：${group.startTime}<br>
        主答辩老师：${group.master}<br>
        答辩老师：
        <c:forEach items="${group.teachers}" var="t">
            ${t.name}
        </c:forEach>
        <br>
        成绩：<br>
    </body>
</html>
