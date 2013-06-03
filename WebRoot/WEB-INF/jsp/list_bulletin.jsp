<%-- 
    Document   : list_bulletin
    Created on : May 14, 2013, 9:57:38 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>所有公告</title>
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
    <body >

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

        <div class="container " >
            <div class="row " >
                <div class="span8 offset2"  >
                    <h3 class="text-center">
                        公告列表
                    </h3>
                    <table class="table table-striped table-hover text-center ">
                        <thead>
                            <tr>
                                <th>
                                    编号
                                </th>
                                <th>
                                    主题
                                </th>
                                <th>
                                    时间
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.bulletins }" var="bulletin" varStatus="status">
                                <tr >
                                    <td >${status.count}</td> 
                                    <td><a href="${pageContext.servletContext.contextPath}/ShowBulletionUIServlet?id=${bulletin.id}"> ${bulletin.topic}</a></td> 
                                    <td> <fmt:formatDate type="date"   value="${bulletin.time}" /></td>
                                    <td><a href="${myContext}/DeleteBulletinServlet?id=${bulletin.id}">删除</a>/<a href="${myContext}/PublishBulletinUIServlet?id=${bulletin.id}">修改</a></td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="pagination pagination-right">
                        <ul>
                            <li>
                                <a href="#">上一页</a>
                            </li>
                            <li>
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
                            <li>
                                <a href="#">下一页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
