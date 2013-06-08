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
                            href="${myContext }/ShowThesisInfoServlet?subjectId=${subject.id}">${subject.title
                            }</a>
                    </td>
                    <td><a href="${myContext }/UserInfoServlet?userId=${subject.teacher.id}">${ subject.teacher.name}</a></td>
                    <td>
                        <c:if test="${subject.checked == true}">
                            已通过
                        </c:if>
                        <c:choose>  
                            <c:when test="${subject.student==null}">尚未有学生选择</c:when>  
                            <c:otherwise><a href="${myContext}/UserInfoServlet?userId=${subject.student.id}">${ subject.student.name}</a>   同学选择了此题</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:url var="urlForStu" value="/SelectSubjectServlet" >
                            <c:param name="subjectId" value="${subject.id }">
                            </c:param>
                        </c:url> 
                        <a href="${myContext}/PublishSubjectUIServlet?id=${subject.id}">修改论题(TODO：确认是否已选)</a>
                        <a href="${urlForStu}" style="display:${sessionScope.user.getClass().simpleName=='Student'?'':'none' } ">选此论文题目</a>
                        <c:choose>  
                            <c:when test="${subject.student==null}">  
                                <a href="${myContext}/DeleteSubjectServlet?id=${subject.id}">删除论题(弹出确认)</a>
                            </c:when>  
                            <c:otherwise>  <a href="${myContext }/ShowThesisInfoServlet?subjectId=${subject.id}" 
                               style="display:${sessionScope.user.getClass().simpleName=='Teacher'?'':'none' } ">查看已提交的论文</a></c:otherwise>
                        </c:choose>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>