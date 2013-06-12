<%-- 
    Document   : ListUserUIServlet
    Created on : Jun 12, 2013, 10:14:41 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>所有用户</title>
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
        <div class="container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>
                            编号
                        </th>
                        <th>
                            用户名
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            邮箱
                        </th>
                        <th>
                            类型
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td><a href="${myContext}/UserInfoServlet?userId=${user.id}">${user.username}</a></td>
                            <td>${user.name}</td>
                            <td> <a href="mailto:${user.email}">${user.email}</a></td>
                            <td>${user.getClass().simpleName}</td>
                            <td>
                                <div class="btn-group">
                                    <a  class="btn  btn-warning" data-trigger="confirm" data-content="是否确认删除此用户!" href="${myContext}/DeleteUserServlet?id=${user.id}">删除</a>
                                    <a class="btn btn-primary" href="${myContext}/RegisterUIServlet?id=${user.id}">修改</a>
                            </td>
                        </tr>  
                    </c:forEach>
                </tbody>
            </table>
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
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
        <script src="./js/sco.modal.js"></script>
        <script src="./js/sco.confirm.js"></script>
    </body>
</html>
