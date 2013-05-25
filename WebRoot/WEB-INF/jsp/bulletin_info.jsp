<%-- 
    Document   : bulletin_info
    Created on : May 13, 2013, 9:13:09 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
        <script src="/ckeditor/ckeditor.js"></script>
    </head>
    <body align="center">
        <h3 align="left">公告</h3>
        <h1>${bulletin.topic}</h1>
        时间： <fmt:formatDate type="both" dateStyle="default" timeStyle="default" 
                        value="${bulletin.time}"/>&nbsp;，&nbsp;来源：${bulletin.admin.name}
        <hr>
        <div contenteditable="false" id="content" style="width: 60%; margin: auto 200px auto 250px;text-indent: 28pt;line-height: 30pt;text-align: left;"  >  ${bulletin.content}</div>
        <script>
            // Turn off automatic editor creation first.
            CKEDITOR.disableAutoInline = true;
            CKEDITOR.inline('content');
        </script>
        <hr>
        <p align="left"> 附件：${bulletin.attachment}</p>
        <c:choose >
            <%-- for user --%>
            <c:when test="${sessionScope.user!=null}">返回</c:when>
            <%-- for preview --%>
            <c:when test="${sessionScope.admin!=null and requestScope.preview==true}"><a href="${pageContext.servletContext.contextPath}/PublishBulletinUIServlet">修改</a>，<a href="${pageContext.servletContext.contextPath}/SubmitBulletinServlet">提交</a></c:when>
            <%-- for admin --%>
            <c:when test="${sessionScope.admin!=null }"><a href="#">修改(还不能改)</a></c:when>
        </c:choose> 

    </body>
</html>
