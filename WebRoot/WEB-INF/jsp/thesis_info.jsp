<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <h1>${subject.title}论文的详细信息</h1>
        <hr>
        <p>论文描述：${subject.description}</p>
        <hr>
        <!--        
                <br />teacher：姓名，电话，职称
                    <br />student：姓名，邮箱，照片-->
        老师信息：
        ${subject.teacher.name}<br>
        学生信息:
        ${subject.student.name}<br>

        已提交的论文：<br>
        <c:forEach items="${requestScope.subject.theses }" var="thesis">
            <hr>
            文件名:${thesis.realFileName}<br>
            提交日期： <fmt:formatDate type="both" dateStyle="default" timeStyle="default" 
                            value="${thesis.submitDate}"/><br>
            <div style="float: left;width: 40%;">学生留言：  <textarea readonly="true" cols="50" rows="5"> ${thesis.studentComment}</textarea></div>
            <div >老师评语：<textarea  readonly="true" cols="50" rows="5"> ${thesis.teacherComment}</textarea></div><br><br>

            <c:url var="downloadURL" value="/DownloadThesisServlet">
                <c:param name="uuidFilePath" value="${thesis.realFilePath}">
                </c:param>
                <c:param name="uuidFileName" value="${thesis.uuidFileName}">
                </c:param>
            </c:url>
            <a href="${downloadURL}">下载</a>,
            <c:if test="${user.getClass().simpleName=='Teacher'}">
                <a href="${pageContext.servletContext.contextPath}/ReviewThesisServlet?id=${thesis.id}">审阅</a>
            </c:if>
        </c:forEach>
        <br />
    </body>
</html>