<%-- 
    Document   : publish_bulletin
    Created on : May 14, 2013, 3:14:58 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
        <script src="js/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <form action="${pageContext.servletContext.contextPath}/SubmitBulletinServlet" method="post">
            <table align="center" width="80%">
                <tr><td>题目:</td><td><input type="text" name="topic" value="${bulletin.topic}" /></td></tr>
                <tr><td>内容:</td><td><textarea name="content" style="width: 800px;height: 450px">${bulletin.content==null?'在此输入内容':bulletin.content}</textarea></td></tr>
                <script>
                    CKEDITOR.replace('content');
                </script>
                <tr><td>附件：</td><td><input type="file" name="attachment"/></td></tr>
                <tr align="right"><td colspan="2" ><input type="submit" value="预览" name="preview"/><input type="submit" value="提交" /></td></tr>
            </table>
        </form>
    </body>
</html>
