<%-- 
    Document   : systemConfig
    Created on : Jun 3, 2013, 12:21:11 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>系统设置</title>
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
        <link href="./css/datetimepicker.css" rel="stylesheet">
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
            <form action="${myContext}/SetSystemConfigServlet" method="post">
                <div>
                    选题开放时间: 
                    <div class="input-append date form_datetime"  >
                        <input class="span2" size="16" type="text" name="thesisStart" value="${thesisStart}">
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>       
                </div>
                <div>
                    选题结束时间:
                    <div class="input-append date form_datetime"  >
                        <input class="span2" size="16" type="text" name="thesisEnd" value="${thesisEnd}">
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>       
                </div>
                <div>
                    答辩开始时间:
                    <div class="input-append date form_datetime"  >
                        <input class="span2" size="16" type="text" name="answerStart" value="${answerStart}">
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>       
                </div>
                答辩每组人数:  <input type="number" name="groupCount" value="${groupCount}"/><br>
                每次答辩时间:  <input type="number" name="answerDuration" value="${answerDuration}"/> 分钟<br>
                <br>
                <div class="btn-group">
                    <input class="btn btn-primary" type="submit" value="提交">
                    <a class="btn" href="javascript:history.go(-1);">上一页</a>
                </div>
            </form>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
        <script src="./js/bootstrap-datetimepicker.js"></script>
        <script src="./js/bootstrap-datetimepicker.zh-CN.js"></script>
        <script>
            $(".form_datetime").datetimepicker({
                format: "yyyy-mm-dd",
                autoclose: true,
                todayBtn: true,
                startDate: "2013-02-14 10:00",
                minuteStep: 10,
                language: "zh-CN"
            });
        </script>
    </body>
</html>
