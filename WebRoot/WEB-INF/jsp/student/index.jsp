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
                <c:when test="${user !=null}">欢迎你：<a href="${pageContext.request.servletContext.contextPath }/UserInfoServlet?userId=${user.id}">${user.name }</a>。 <a>设置</a>|<a
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


        <!--学生-->
        <c:if test="${user!=null }">
            第一阶段：   <a href="${myContext}/ListBulletinServlet">查看公告</a>
            <a href="${myContext}/servlet/ListSubjectServlet">选择论题</a>
            <br>
            第二阶段：        <a
                href="${myContext}/servlet/SubmitThesisUIServlet">提交论文</a>
            <a href="${myContext}/servlet/ShowThesisInfoServlet?userId=${user.id}">已提交的论文</a>
            <a href="${myContext}/SubmitJournalUIServlet">提交周志</a>
            <br>
            联系：
            <a href="mailto:<jsp:include page="/GetMyTeacherEmail" />">联系老师(email)</a>
            //
            <a target="_blank" href="javascript:;" onclick="openwin();">联系老师(站内信)</a>
            <a href="#">给管理员提意见(留言板)</a>
            <a href="${myContext}/ListMailServlet">站内信<SUP><strong><jsp:include page="/GetUnreadMailCount" /> </strong></SUP></a>
            <br>
            答辩阶段：<a href="#">查看成绩</a>
            <a href="#">查看答辩安排</a>

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