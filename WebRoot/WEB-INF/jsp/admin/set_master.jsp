<%-- 
    Document   : set_master
    Created on : Jun 8, 2013, 1:05:36 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <form action="${myContext}/SaveMasterServlet" method="post">
            <input type="hidden" value="${byId.id}" name="id"/>
            <select name="select">
                <c:forEach items="${byId.teachers}" var="t">
                    <option value="${t.id}">${t.name}</option>
                </c:forEach>
            </select>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">保存</button>
                <button type="button" class="btn">取消</button>
            </div>
        </form>
    </body>
</html>
