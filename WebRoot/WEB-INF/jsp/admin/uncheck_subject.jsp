<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="myContext" value="${pageContext.servletContext.contextPath}"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>论文列表</title>
    </head>
    <body>
        <table border="1" align="center" width="70%">
            <caption>待审核论文列表</caption>
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
        ${success}
    </body>
</html>