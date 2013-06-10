<%-- 
    Document   : start_answer
    Created on : Jun 10, 2013, 6:29:26 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <li><a href="#">开始答辩</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">邮件 <span class="badge badge-info"><jsp:include page="/GetUnreadMailCount" /></span> <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">发邮件</a></li>
                                    <li><a href="${myContext}/ListMailServlet">收件箱</a></li>
                                    <li><a target="_blank" href="javascript:;" onclick="openwin();">联系学生</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">其他方式</li>
                                    <li><a href="mailto:"/>E-mail</a></li>
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
            <div >
                <ul class="nav nav-tabs" data-trigger="tab" data-easing="slide">
                    <c:forEach begin="1" end="${fn:length(archives)}" var="i">
                        <li class=""><a href="#tab${i}">第${i}篇</a></li>
                        </c:forEach>
                </ul>
                <div class="pane-wrapper slide">
                    <c:forEach items="${archives}" var="archive" varStatus="status">
                        <!--每一个tab-->
                        <div class="">
                            <c:choose>
                                <c:when test="${archive==null}">
                                    <h1 class="label label-important ">该学生未提交论文!</h1>
                                </c:when>
                                <c:otherwise>
                                    <div class="page-header">
                                        <h1>${archive.subject.title}</h1>
                                    </div>
                                    <div class="hero-unit span7">${archive.subject.description}</div>
                                    <div class="span3" >
                                        <h4>老师信息：</h4>
                                        <span class="label label-info">姓名：</span>${archive.subject.teacher.name}&nbsp;&nbsp;<span class="label label-info">邮件：</span>${archive.subject.teacher.email}
                                    </div>
                                    <br>
                                    <div class="span3">
                                        <h4>学生信息：</h4>
                                        <span class="label label-info">姓名：</span>${archive.subject.student.name}&nbsp;&nbsp;<span class="label label-info">邮件：</span>${archive.subject.student.email}
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr>
                                    <h3>${archive.thesis.realFileName}</h3>
                                    提交日期： <fmt:formatDate type="date" dateStyle="default"  value="${archive.thesis.submitDate}"/>
                                    <c:url var="downloadURL" value="/DownloadThesisServlet">
                                        <c:param name="uuidFilePath" value="${thesis.realFilePath}">
                                        </c:param>
                                        <c:param name="uuidFileName" value="${thesis.uuidFileName}">
                                        </c:param>
                                    </c:url>
                                    <a class="btn" href="${downloadURL}">下载</a>
                                    <div class="pull-right">
                                        <form action="${myContext }/MarkGradeServlet" method="post" >
                                            评分：<input type="hidden" name="archiveId" value="${archive.id}">
                                            <select class="span1" name="grade">
                                                <option>40</option>
                                                <option>50</option>
                                                <option>60</option>
                                                <option>65</option>
                                                <option>70</option>
                                                <option>75</option>
                                                <option>80</option>
                                                <option>85</option>
                                                <option>90</option>
                                                <option>95</option>
                                                <option>100</option>
                                            </select> &nbsp;
                                            <input class="btn btn-primary" type="submit" value="提交评分"/>
                                        </form>     
                                    </div>           

                                </c:otherwise>
                            </c:choose>
                        </div>
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
