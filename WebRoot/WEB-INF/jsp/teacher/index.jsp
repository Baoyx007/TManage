<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="myContext" value="${pageContext.request.servletContext.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>首页</title>
        <script LANGUAGE="JavaScript">

<!--

            function openwin() {
                window.open("${myContext}/MailToUserServlet?toWho=MyTeacher", "mail", "height=600, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");

            }

//-->

        </script>
    </head>
    <!-- 设置服务器context -->


    <body style="text-align: center;">
        <h1>毕业设计管理系统</h1>
        <br>
        <div style="text-align:right;">
            <c:choose>
                <c:when test="${user !=null}">欢迎你：<a href="${pageContext.request.servletContext.contextPath }/UserInfoUIServlet?userId=${user.id}">${user.name }</a>。 <a>设置</a>|<a
                        href="${myContext}/servlet/LogoutServlet">注销</a>
                </c:when>
                <c:otherwise>
                    <a
                        href="${myContext}/servlet/RegisterUIServlet">注册</a>
                    <a href="${myContext}/LoginUIServlet">登陆</a>
                    <br>
                </c:otherwise>
            </c:choose>

        </div>
        <hr>


        <!--老师-->
        ${user}
        <c:if test="${user!=null  }">
            <a
                href="${myContext}/servlet/PublishSubjectUIServlet">发布论文题目</a>
        </c:if>


        <hr>
        进度:黑点(可供点)对应上一览的链接
        <img src="img/progress.png"/>
        <br>
        <hr>
        <hr>测试区<br>
        user=${user }
        <br>
        <a
            href="${myContext}/servlet/ListSubjectServlet">查看所有论文</a>
        <br />
        <hr>
        <hr>
    </body>
</html>