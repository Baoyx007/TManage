<%-- 
    Document   : answer_info
    Created on : Jun 8, 2013, 3:39:19 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>答辩</title>
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
                    <a class="brand" href="${myContext}/">毕业设计管理系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li class="active"><a href="${myContext}/TeacherIndexUIServlet">主页</a></li>
                            <li><a href="${myContext}/ListBulletinServlet">公告</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">论题 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/PublishSubjectUIServlet">发布论题</a></li>
                                    <li><a href="${myContext}/ListSubjectServlet">我的论题</a></li>
                                    <li><a href="#myArchive">确认选题</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">审阅 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/GetUnreadedThesisServlet">论文审阅</a></li>
                                    <li><a href="${myContext}/GetUnreadJournalServlet">周志审阅</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">答辩 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/AnswerInfoUIServlet">查看安排</a></li>
                                    <li><a href="${myContext}/StartAnswerUIServlet">开始答辩</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">邮件 <span class="badge badge-info"><jsp:include page="/GetUnreadMailCount" /></span> <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/ListMailServlet">收件箱</a></li>
                                    <li><a target="_blank" href="javascript:;" onclick="openwin();">联系学生</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">其他方式</li>
                                    <li><a href="mailto:"/>E-mail</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav pull-right">
                            <li><a href="${myContext}/UserInfoServlet?userId=${user.id}">${user.name }</a></li>
                            <li class="divider-vertical">
                            <li><a href="${myContext}/RegisterUIServlet?id=${user.id}">设置</a></li>
                            <li><a href="${myContext}/LogoutServlet">注销</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <!--container-->
        <div class="container">
            <table class="table table-hover">
                <tr>
                    <td> 组次：</td>
                    <td>${group.sequence}</td>
                </tr>
                <tr>
                    <td>  开始时间：</td>
                    <td><fmt:formatDate type="date" value="${group.startTime}" /></td>
                </tr>
                <tr>
                    <td>   主答辩老师：</td>
                    <td> <a href="${myContext}/UserInfoServlet?userId=${group.master.id}">${group.master.name}</a></td>
                </tr>
                <c:forEach items="${group.students}" var="t">
                    <tr>
                        <td>   该组的学生：</td>
                        <td> <a href="${myContext}/UserInfoServlet?userId=${t.id}">  ${t.name}</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>
