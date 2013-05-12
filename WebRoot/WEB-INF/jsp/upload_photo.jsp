
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    </head>

    <h1>更改头像</h1>
    Tips:....
    <body>
        <table align="center" width="80%">
            <tr>
                <td>你的头像：
                    <c:choose >
                        <c:when test="${user.photo==null}"> 
                            <img src="img/${user.gender}.png" width="150" height="200"/></c:when>
                        <c:otherwise>
                            <img src="ShowPhotoUIServlet?param=${user.photo}"  width="150" height="200"/>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>

        <hr>
        <form
            action="${pageContext.request.contextPath }/UploadPhotoServlet"
            method="post" enctype="multipart/form-data">
            <table border="1" align="center">
                <tr>
                    <th>上传头像</th>
                    <td><input type="file" name="photo" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="提交"></td>
                </tr>
            </table>
        </form>
    </body>
</html>