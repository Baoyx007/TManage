<%-- 
    Document   : back_index
    Created on : May 13, 2013, 8:55:26 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>毕设管理</title>
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
                            <li><a href="#about">选题</a></li>
                            <li><a href="#about">论文</a></li>
                            <li><a href="#contact">邮件</a></li>
                            <li><a href="#contact">周志</a></li>
                            <li><a href="#contact">答辩</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">公告 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${myContext}/PublishBulletinUIServlet">发布公告</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">导航栏</li>
                                    <li><a href="${myContext}/ListBulletinServlet">所有公告</a></li>
                                </ul>
                            </li>
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

            选题管理:
            <a href="${pageContext.servletContext.contextPath}/CheckSubjectServlet">审核论题（删）</a>
            <a href="${pageContext.servletContext.contextPath}/servlet/ListSubjectServlet">已通过的论题</a>
            <input type="search" >查找论题(通过主题,查)
            <br>
            系统管设置:（一个界面，修改）
            <a href="${myContext}/SystemConfigUIServlet">毕业设计系统设置</a>
            <br>
            <a href="${myContext}/AnswerManageServlet">答辩安排</a>
            <a href="#">所有论文</a>
            <br>
            用户管理(增<a href="${myContext}/RegisterUIServlet">注册用户</a>,，删，改)
        </div>
        <hr>
        测试：<br>
        管理员：${user}
        <hr>
        ${user.getClass().simpleName}
        <script src="./js/jquery.js"></script>
    </body>
</html>
