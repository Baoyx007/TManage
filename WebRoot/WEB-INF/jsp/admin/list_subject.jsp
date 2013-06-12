<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="myContext" value="${pageContext.servletContext.contextPath}"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>论文列表</title>
        <meta charset="utf-8">
        <meta name="description" content="毕设">
        <meta name="author" content="haven">
        <!-- Le styles -->
        <link href="./css/bootstrap.css" rel="stylesheet">
        <link href="./css/scojs.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
        <link href="./css/scojis.css" rel="stylesheet">
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
                                    <li><a href="${myContext}/PublishBulletinUIServlet">安排答辩</a></li>
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
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>论文名</th>
                        <th>发布人</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.subjects }" var="subject">
                    <tr>
                        <td><a
                                href="${myContext }/ShowThesisInfoServlet?subjectId=${subject.id}">${subject.title
                                }</a>
                        </td>
                        <td><a href="${myContext }/UserInfoServlet?userId=${subject.teacher.id}">${ subject.teacher.name}</a></td>
                            <c:choose>  
                                <c:when test="${subject.student==null}">
                                <td>尚未有学生选择</td>
                                <td>
                                    <a data-trigger="confirm" data-content="是否确认删除此论题!" class="btn  btn-warning" href="${myContext}/DeleteSubjectServlet?id=${subject.id}">删除论题</a>
                                </td>
                            </c:when>  
                            <c:otherwise>
                                <td><a href="${myContext}/UserInfoServlet?userId=${subject.student.id}">${ subject.student.name}</a>   同学选择了此题
                                </td>
                                <td>
                                    <a  class="btn " href="${myContext }/ArchiveInfoUIServlet?subjectId=${subject.id}" >查看论文</a>
                                </td>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                </c:forEach>
            </table>
        </div>

        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
        <script src="./js/sco.modal.js"></script>
        <script src="./js/sco.confirm.js"></script>
    </body>
</html>