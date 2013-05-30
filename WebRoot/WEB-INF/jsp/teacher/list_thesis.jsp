<%-- 
    Document   : list_thesis
    Created on : May 30, 2013, 5:20:51 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="myContext" value="${pageContext.servletContext.contextPath}"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${empty requestScope.unreadedThesises}">
            占无未审阅的论文<a href="${pageContext.servletContext.contextPath }/">返回首页</a
        </c:if>
        <c:forEach items="${requestScope.unreadedThesises}" var="thesis">
            <h1>${thesis.subject.title}</h1>
            <hr>
            <p>论文描述：${thesis.subject.description}</p>
            <hr>
            学生:
            ${thesis.subject.student.name}<br>
            <hr>
            文件名:${thesis.realFileName}<br><br>
            提交日期： <fmt:formatDate type="both" dateStyle="default" timeStyle="default" 
                              value="${thesis.submitDate}"/><br>

        <hr>
        <div style="float: left;width: 40%;">学生留言：<textarea readonly="true" cols="50" rows="10"> ${thesis.studentComment}</textarea> </div>
        <form
            action="${pageContext.servletContext.contextPath }/SubmitTeacherCommentServlet"
            method="post" >
            <input type="hidden" name="thesisId" value="${thesis.id}">
            <div>老师评语：<textarea id="teacherComment" name="teacherComment" cols="50" rows="10"> ${thesis.teacherComment}</textarea></div>
            <br><br>
            <input type="submit" value="提交评语"/>${success}
        </form>
        <br>

        <c:url var="downloadURL" value="/DownloadThesisServlet">
            <c:param name="uuidFilePath" value="${thesis.realFilePath}">
            </c:param>
            <c:param name="uuidFileName" value="${thesis.uuidFileName}">
            </c:param>
        </c:url>
        <a href="${downloadURL}">下载</a>, <a href="${pageContext.servletContext.contextPath }/servlet/SubmitThesisUIServlet?subjectId=${thesis.subject.id}">上传已审阅的论文</a>

    </c:forEach>
</body>
</html>
