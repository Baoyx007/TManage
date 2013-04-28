<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>提交论文</h1>
	Tips:....
	<br> Tips:....
	<br> Tips:....
	<br> Tips:上传文件大小限制在10M以内
	<br> Tips:....
	<br> Tips:只能上传doc,txt,docx格式的文件
	<br> Tips:....
	<br> Tips:....
	<br> Tips:....
	<br>你提交的论文题目是：
	<a href="#">${subject.title } </a>
	<br>

	<hr>
	<form
		action="${pageContext.request.contextPath }/servlet/SubmitThesisServlet"
		method="post" enctype="multipart/form-data">
		<table border="1" align="center">
			<tr>
				<th>上传论文</th>
				<td><input type="file" name="thesis" /></td>
			</tr>
			<tr>
				<th>给老师留言</th>
				<td><textarea rows="10" cols="50" name="comment"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>