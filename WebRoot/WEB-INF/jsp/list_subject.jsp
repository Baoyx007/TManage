<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>论文列表</title>
    </head>
    <body>
        <table border="1" align="center" width="70%">
            <caption>论文列表</caption>
            <tr>
                <th>论文名</th>
                <th>发布者</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.subjects }" var="subject">
                <tr>
                    <td><a
                            href="${pageContext.request.servletContext.contextPath }/servlet/ShowThesisInfoServlet?subjectId=${subject.id}">${subject.title
                            }</a>
                    </td>
                    <td><a href="#">${ subject.teacher.name}</a></td>
                    <td><c:choose>  
                            <c:when test="${subject.student==null}">尚未有学生选择</c:when>  
                            <c:otherwise><a href="#">${ subject.student.name}</a>   同学选择了此题</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:url var="urlForStu" value="/servlet/SelectSubjectServlet">
                            <c:param name="subjectId" value="${subject.id }">
                            </c:param>
                        </c:url> <a href="${urlForStu}" style="display:${role=='student'?'':'none' } ">选此论文题目</a>
                        <a href="${pageContext.request.servletContext.contextPath }/servlet/ShowThesisInfoServlet?subjectId=${subject.id}" style="display:${role=='teacher'?'':'none' } ">下载已提交的论文</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>