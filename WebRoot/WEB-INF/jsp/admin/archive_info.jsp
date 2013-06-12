<%-- 
    Document   : archive_info
    Created on : Jun 12, 2013, 2:39:49 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>论文信息</title>
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
            <c:choose>
                <c:when test="${archive==null}">
                     <h1 class="label label-important ">该学生未提交论文终稿!</h1>
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
                        <c:param name="uuidFilePath" value="${archive.thesis.realFilePath}">
                        </c:param>
                        <c:param name="uuidFileName" value="${archive.thesis.uuidFileName}">
                        </c:param>
                    </c:url>
                    <a class="btn" href="${downloadURL}">下载</a>

                    <hr>
                    <h1>成绩：${archive.score}<small>已有${archive.count}位老师评分</small></h1>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
