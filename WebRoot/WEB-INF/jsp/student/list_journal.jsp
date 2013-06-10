<%-- 
    Document   : sumbit_journal
    Created on : May 31, 2013, 2:56:42 PM
    Author     : Haven
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>周志</title>
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
        <link rel="stylesheet" href="./css/scojs.css">
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
                            <li ><a href="${myContext}/StudentIndexUIServlet">主页</a></li>
                            <li><a href="${myContext}/ListBulletinServlet">公告</a></li>
                            <li><a href="${myContext}/ListSubjectServlet">选题</a></li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">论文 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/SubmitThesisUIServlet">提交论文</a></li>
                                    <li><a href="${myContext}/ShowThesisInfoServlet?userId=${user.id}">我的论文</a></li>
                                    <li><a href="#myArchive">确定终稿</a></li>
                                </ul>
                            </li>
                            <li class="active"><a  href="${myContext}/SubmitJournalUIServlet">周志</a></li>
                            <li><a href="${myContext}/AnswerInfoUIServlet">答辩</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">邮件 <span class="badge badge-info"><jsp:include page="/GetUnreadMailCount" /></span> <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">发邮件</a></li>
                                    <li><a href="${myContext}/ListMailServlet">收件箱</a></li>
                                    <li><a target="_blank" href="javascript:;" onclick="openwin();">联系老师</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">其他方式</li>
                                    <li><a href="mailto:<jsp:include page="/GetMyTeacherEmail"/>">E-mail</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav pull-right">
                            <li><a href="#about">${user.name }</a></li>
                            <li class="divider-vertical">
                            <li><a href="#">设置</a></li>
                            <li><a href="${myContext}/LogoutServlet">注销</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <!--container-->
        <div class="container">
            <div class="span8 offset2" >
                <ul class="nav nav-tabs" data-trigger="tab" data-easing="slide">
                    <li class="active"><a href="#tab1">第一篇</a></li>
                    <li class=""><a href="#tab2">第二篇</a></li>
                    <li class=""><a href="#tab3">第三篇</a></li>
                </ul>
                <div class="pane-wrapper slide">
                    <c:forEach items="${myJournals}" var="journal" varStatus="status">
                        <!--每一个tab-->
                        <div class="">
                            <h1 class="text-center">${journal.topic}</h1>
                            <p>${journal.content}</p>
                            <hr>
                            <c:choose>
                                <c:when test="${empty journal.teacher}"><span class="label label-info">老师尚未评价</span></c:when>
                                <c:otherwise>  
                                    <span class="label label-important">老师评语: </span>&nbsp;&nbsp;<textarea  readonly="true"> ${journal.opinion}</textarea>
                                    <div><strong>${journal.teacher.name}</strong>&nbsp;&nbsp; ${journal.reviewDate}</div></c:otherwise>
                            </c:choose>
                        </div>
                    </c:forEach>
                    <c:forEach begin="${fn:length(myJournals)}" end="3">
                        <div class=""> <a class="btn btn-block btn-large btn-primary" href="${myContext}/SubmitJournalUIServlet?real=true">创建一片新的周志</a> </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
        <script src="./js/sco.panes.js"></script>
        <script src="./js/sco.tab.js"></script>
    </body>
</html>
