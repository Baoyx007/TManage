<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="myContext" value="${pageContext.servletContext.contextPath}"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>论题列表</title>
    </head>
    <body>
        <table border="1" align="center" width="70%">
            <caption>待审核论题</caption>
            <tr>
                <th>论文名</th>
                <th>发布者</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.uncheckedSubjects }" var="subject">
                <tr>
                    <td><a
                            href="${myContext }/servlet/ShowThesisInfoServlet?subjectId=${subject.id}">${subject.title
                            }</a>
                    </td>
                    <td><a href="${myContext }/UserInfoServlet?userId=${subject.teacher.id}">${ subject.teacher.name}</a></td>
                    <td>
                        <a href="${myContext }/PassSubjectServlet?pass=true&id=${subject.id}">通过</a>/<a href="${myContext }/PassSubjectServlet?pass=false&id=${subject.id}">拒绝</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        ${success}<br>
        <a href="${pageContext.servletContext.contextPath}/">返回</a>
    </body>
</html>