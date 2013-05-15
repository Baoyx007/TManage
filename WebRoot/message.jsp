<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>


        <title>全局消息显示页面</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">


    </head>

    <body>
        ${message }
        <br>
        <c:choose >
            <c:when test="${sessionScope.user!=null}">
                <a href="${pageContext.servletContext.contextPath }/index.jsp">返回首页</a>
            </c:when>
            <c:when test="${sessionScope.admin!=null}">
                <a href="${pageContext.servletContext.contextPath }/BackIndexUIServlet">返回首页</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.servletContext.contextPath }/LoginUIServlet">返回登陆</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
