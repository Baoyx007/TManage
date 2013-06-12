<%-- 
    Document   : answer_manage
    Created on : Jun 8, 2013, 12:09:24 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>答辩管理</title>
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
                                    <li><a href="${myContext}/ListBulletinServlet">所有答辩论文</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户管理 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/PublishBulletinUIServlet">注册用户</a></li>
                                    <li><a href="${myContext}/ListBulletinServlet">所有用户</a></li>
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
                        </ul>
                        <ul class="nav pull-right">
                            <li><a href="#about">${user.name }</a></li>
                            <li class="divider-vertical">
                            <li><a href="#">设置</a></li>
                            <li><a href="${myContext}/LogoutServlet">注销</a></li>
                        </ul>
                    </div>

                </div><!--/.nav-collapse -->
            </div>
        </div>
        <div class="container">
            <h1>答辩管理</h1>
            <div class="hero-unit">
                答辩开始时间: ${answerStart}。<br>
                答辩每组人数:  ${groupCount}。<br>
                每次答辩持续时间:  ${answerDuration}分钟。<br><br>
                <div class="btn-group">
                    <a class="btn" href="${myContext}/SystemConfigUIServlet">更多设置</a>
                    <a class="btn btn-primary" href="${myContext}/getRandomGroupServlet">自动产生答辩组</a>
                </div>
            </div>

            <hr>
            <div class="accordion" id="accordion2">
                <c:forEach items="${findAll}" var="group" varStatus="status">

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${status.count}">
                                第${group.sequence}组
                            </a>
                        </div>
                        <div id="collapse${status.count}" class="accordion-body collapse in">
                            <div class="accordion-inner">

                                开始答辩时间： <fmt:formatDate type="date" dateStyle="default"  value="${group.startTime}"/><br>

                                <c:if test="${group.master == null}">
                                    <form class="form-inline" action="${myContext}/SaveMasterServlet" method="post">
                                        <input type="hidden" value="${group.id}" name="id"/>
                                        <select name="select">
                                            <c:forEach items="${group.teachers}" var="t">
                                                <option value="${t.id}">${t.name}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit" class="btn btn-primary btn-small">设置主答辩老师</button>
                                    </form>
                                </c:if>
                                <c:if test="${group.master != null}">
                                    组主答辩老师：<a href="UserInfoServlet?userId=${group.master.id}"> ${group.master.name}</a><br>
                                </c:if>
                                <strong>学生：</strong>
                                <c:forEach items="${group.students}" var="s">
                                    <a href="UserInfoServlet?userId=${s.id}"> ${s.name}</a>&nbsp;&nbsp;
                                </c:forEach>
                                <br>
                                <strong> 老师：</strong>
                                <c:forEach items="${group.teachers}" var="t">
                                    <a href="UserInfoServlet?userId=${t.id}"> ${t.name}</a>&nbsp;&nbsp;
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>
