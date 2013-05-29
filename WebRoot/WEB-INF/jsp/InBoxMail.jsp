<%-- 
    Document   : InBoxMail
    Created on : May 19, 2013, 10:55:31 PM
    Author     : Haven
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:choose >
            <c:when test="${requestScope.unreadMailList==null}">没有未读邮件</c:when>
            <c:otherwise >
                <c:forEach items="${requestScope.unreadMailList}" var="unreadMail">
                    <div style="color:#0782C1 ">
                        <a href="${pageContext.servletContext.contextPath}/ShowMailInfoServlet?mailId=${unreadMail.id}">    
                            ${unreadMail.topic} ——————   ${unreadMail.sendTime}
                        </a>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <br>
        <br>
        <br>
        <div>已读</div>
        <hr>
        <c:choose >
            <c:when test="${requestScope.readedMailList==null}">没有已读邮件</c:when>
            <c:otherwise > 
                <c:forEach items="${readedMailList}" var="readedMail">
                    <div>
                        <a href="${pageContext.servletContext.contextPath}/ShowMailInfoServlet?mailId=${readedMail.id}">    
                            ${readedMail.topic} ——————   ${readedMail.sendTime}
                        </a>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <br><br><br><br><br><br><br>
        <a href="${pageContext.servletContext.contextPath}/">返回首页</a>
    </body>
</html>
