<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>论文详情</title>
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
            <div class="page-header">
                <h1>${subject.title}<small>任务书</small></h1>
            </div>
            <div class="hero-unit span7">${subject.description}</div>
            <div class="span3" >
                <h4>老师信息：</h4>
                <span class="label label-info">姓名：</span><a href="${myContext}/UserInfoServlet?userId=${subject.teacher.id}">${subject.teacher.name}</a>&nbsp;&nbsp;<span class="label label-info">邮件：</span>${subject.teacher.email}
                <textarea class="text-info" rows="3" readonly>${subject.teacher.comment}</textarea>
            </div>
            <br>
            <div class="span3">
                <h4>学生信息：</h4>
                <span class="label label-info">姓名：</span><a href="${myContext}/UserInfoServlet?userId=${subject.student.id}">${subject.student.name}</a>&nbsp;&nbsp;<span class="label label-info">邮件：</span>${subject.student.email}
                <textarea class="text-info" rows="3" readonly>${subject.student.comment}</textarea>
            </div>
            <div class="clearfix"></div>
            <h2 id="myArchive">已提交的论文：</h2> <hr>
            <div class="accordion" id="accordion2">
                <c:forEach items="${requestScope.subject.theses }" var="thesis" varStatus="status">

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${status.count}">
                                ${thesis.realFileName}
                            </a>
                            <c:if test="${thesis.id==archiveThesis.id}"><span class="label label-success pull-right">终稿</span></c:if>
                            </div>
                            <div id="collapse${status.count}" class="accordion-body collapse in">
                            <div class="accordion-inner">

                                提交日期： <fmt:formatDate type="both" dateStyle="default" timeStyle="default" 
                                                value="${thesis.submitDate}"/><br>
                                <div style="float: left;width: 40%;">学生留言：  <textarea readonly="true" cols="50" rows="5"> ${thesis.studentComment}</textarea></div>
                                <div >老师评语：<textarea  readonly="true" cols="50" rows="5"> ${thesis.teacherComment}</textarea></div><br><br>

                                <c:url var="downloadURL" value="/DownloadThesisServlet">
                                    <c:param name="uuidFilePath" value="${thesis.realFilePath}">
                                    </c:param>
                                    <c:param name="uuidFileName" value="${thesis.uuidFileName}">
                                    </c:param>
                                </c:url>
                                <div class="btn-group pull-right">
                                    <a class="btn" href="${downloadURL}">下载</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>