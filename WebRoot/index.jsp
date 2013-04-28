<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>首页</title>
    </head>

    <body style="text-align: center;">
        <h1>毕业设计管理系统</h1>
        <br>
        <div style="text-align:right;">
            <c:choose>
                <c:when test="${user !=null}">欢迎你：${user.name }。<a
                        href="${pageContext.request.contextPath }/servlet/LogoutServlet">注销</a>
                </c:when>
                <c:otherwise>
                    <a
                        href="${pageContext.request.contextPath }/servlet/RegisterUIServlet">注册</a>
                    <a href="${pageContext.request.contextPath }/servlet/LoginUIServlet">登陆</a>
                    <br>
                </c:otherwise>
            </c:choose>

        </div>
        <hr>
        ${role },${user }
        <br>
        <a
            href="${pageContext.request.contextPath }/servlet/ListSubjectServlet">查看所有论文</a>
        <br />

        <!--老师-->
        <c:if test="${user!=null && role=='teacher' }">
            <a
                href="${pageContext.request.contextPath }/servlet/PublishSubjectUIServlet">发布论文题目</a>
        </c:if>

        <!--学生-->
        <c:if test="${user!=null && role=='student' }">
            <a
                href="${pageContext.request.contextPath }/servlet/SubmitThesisUIServlet">提交论文</a>
        </c:if>
    </body>
</html>