<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="../js/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <h1>发布论文题目</h1>
        <form
            action="${pageContext.request.servletContext.contextPath }/servlet/PublishSubjectServlet"
            method="post">
            题目:
            <input type="text" name="title" />
            <textarea id="description" rows="10" cols="100" name="description">在这里输入描述</textarea>
            <script>
                CKEDITOR.replace('description');
            </script>
            <input type="submit" value="提交" />
        </form>
        <br><br><br><br>
        <a href="${pageContext.request.servletContext.contextPath }/">返回首页</a>
    </body>
</html>