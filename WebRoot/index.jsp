<%-- 
    Document   : index
    Created on : Jun 1, 2013, 4:03:29 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="myContext" value="${pageContext.request.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>毕业设计管理系统</title>
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
                            <li class="active"><a href="#">主页</a>
                            </li><li><a href="#about">选题</a></li>
                            <li><a href="#about">论文</a></li>
                            <li><a href="#contact">邮件</a></li>
                            <li><a href="#contact">周志</a></li>
                            <li><a href="#contact">答辩</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">杂项 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="navbar-form pull-right" action="${pageContext.servletContext.contextPath }/LoginServlet"
                              method="post">
                            <input class="span2" type="text" name="username" placeholder="用户名">
                            <input class="span2" type="password" name="password" placeholder="密码">
                            <button type="submit" class="btn">登陆</button>
                        </form>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Main hero unit for a primary marketing message or call to action -->
            <div class="hero-unit">
                <h1>毕业设计进度条</h1>
                <p>一般进来看到大致的进度，登陆后可以看到详细的进度</p>
                <div class="progress progress-striped active">
                    <div class="bar" style="width: 50%;"></div>
                </div>
                <p><a href="#" class="btn btn-primary btn-large">详情 &raquo;</a></p>
            </div>

            <!-- Example row of columns -->
            <div class="row">
                <div class="span4">
                    <h2>${top2[0].topic}</h2>
                    <p>${top2[0].content}</p>
                    <p><a class="btn" href="#">详情&raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>${top2[1].topic}</h2>
                    <p>${top2[1].content}</p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
                <div class="span4">
                    <a class="btn btn-info btn-large btn-block" href="${myContext}/ListBulletinServlet">更多公告</a>
                </div>
            </div>

            <hr>

            <footer>
                <p>&copy; Ahut By Haven 2013</p>
            </footer>

        </div> <!-- /container -->

    </body>
</html>

