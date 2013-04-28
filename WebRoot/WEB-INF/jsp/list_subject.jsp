<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center" width="70%">
		<caption>论文列表</caption>
		<tr>
			<th>论文名</th>
			<th>发布者</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${requestScope.subjects }" var="entry">
			<tr>
				<td><a
					href="${pageContext.request.contextPath }/servlet/ShowThesisInfoServlet?subjectId=${entry.key.id}">${entry.key.title
						}</a>
				</td>
				<td>${ entry.value}</td>
				<td><c:url var="myURL" value="/servlet/SelectSubjectServlet">
						<c:param name="subjectId" value="${entry.key.id }">
						</c:param>
					</c:url> <a href="${myURL}" style="display:${role=='student'?'':'none' } ">选此论文题目</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>