<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <h1>发布论文题目</h1>
        <form
            action="${pageContext.request.servletContext.contextPath }/servlet/PublishSubjectServlet"
            method="post">
            <table align="center" border="1" width="70%">
                <tr>
                    <td>题目:</td>
                    <td><input type="text" name="title" />
                    </td>
                </tr>
                <tr>
                    <td>描述:</td>
                    <td><textarea rows="10" cols="100" name="description">这里的编辑框应该跟多种</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="提交" />
                    </td>
                </tr>
            </table>
        </form>
        <a href="${pageContext.request.servletContext.contextPath }/">返回首页</a>
    </body>
</html>