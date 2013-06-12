<%-- 
    Document   : InBoxMail
    Created on : May 19, 2013, 10:55:31 PM
    Author     : Haven
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>我的邮箱</title>
        <meta charset="utf-8">
        <meta name="description" content="毕设">
        <meta name="author" content="haven">
        <!-- Le styles -->
        <link href="./css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
    </head>
    <body>
        <!--header导航栏-->
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="${myContext}">毕业设计管理系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li class="active"><a href="${myContext}/BackIndexUIServlet">主页</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">论题管理<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/CheckSubjectServlet">审核论题</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${myContext}/ListSubjectServlet">已通过的论题</a></li>
                                    <li><a href="${myContext}/ListBulletinServlet">查找论题</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">答辩 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/AnswerManageServlet">安排答辩</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${myContext}/ListArchiveUIServlet">所有答辩论文</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户管理 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/RegisterUIServlet">注册用户</a></li>
                                    <li><a href="${myContext}/ListUserUIServlet">所有用户</a></li>
                                    <li><a href="${myContext}/ListBulletinServlet">查找用户</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">公告 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/PublishBulletinUIServlet">发布公告</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${myContext}/ListBulletinServlet">所有公告</a></li>
                                </ul>
                            </li>
                            <li><a href="${myContext}/SystemConfigUIServlet">系统设置</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">邮件 <span class="badge badge-info"><jsp:include page="/GetUnreadMailCount" /></span> <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/ListMailServlet">收件箱</a></li>
                                </ul>
                            </li>                        
                        </ul>
                        <ul class="nav pull-right">
                            <li><a href="${myContext}/UserInfoServlet?userId=${user.id}">${user.name }</a></li>
                            <li class="divider-vertical">
                            <li><a href="${myContext}/RegisterUIServlet?id=${user.id}">设置</a></li>
                            <li><a href="${myContext}/LogoutServlet">注销</a></li>
                        </ul>
                    </div>

                </div><!--/.nav-collapse -->
            </div>
        </div>
        <!--container-->
        <div class="container">
            <div class="page-header"><h1 >我的邮箱</h1></div>

            <!--Body content-->
            <span class="label label-important">未读</span>
            <br><br>
            <c:choose >
                <c:when test="${requestScope.unreadMailList==null}">没有未读邮件</c:when>
                <c:otherwise >
                    <table class="table table-hover">
                        <c:forEach items="${requestScope.unreadMailList}" var="unreadMail">
                            <tr>
                                <td><a href="${pageContext.servletContext.contextPath}/ShowMailInfoServlet?mailId=${unreadMail.id}">    
                                        ${unreadMail.topic} </a>
                                </td>
                                <td>
                                    ${unreadMail.sendTime}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>

            <br>
            <br>
            <span class="label label-success">已读</span>
            <br><br>
            <c:choose >
                <c:when test="${requestScope.readedMailList==null}">没有已读邮件</c:when>
                <c:otherwise > 
                    <table class="table table-hover">
                        <c:forEach items="${readedMailList}" var="readedMail">
                            <tr>  <td> <a href="${pageContext.servletContext.contextPath}/ShowMailInfoServlet?mailId=${readedMail.id}">    
                                        ${readedMail.topic}</a> 
                                </td><td>
                                    ${readedMail.sendTime}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>
