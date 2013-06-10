<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>提交论文</title>
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
                                    <li><a href="${myContext}/SubmitJournalUIServlet">周志审阅</a></li>
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
            <div class="page-header">
                <h1>提交论文</h1>
            </div>

            <div class="row">
                <div class="span6">
                    <h4>提示：</h4>
                    1、上传文件大小限制在10M以内<br>2、只能上传doc,txt,docx格式的文件</div>
                <div class="span6">你提交的论文题目是： 
                    <a href="${pageContext.request.servletContext.contextPath }/ShowThesisInfoServlet?subjectId=${subject.id}">${subject.title } </a>
                    <br>你已提交了${fn:length(subject.theses)}篇论文
                </div>
            </div>
            <hr>
            <form
                action="${pageContext.servletContext.contextPath }/SubmitThesisServlet"
                method="post" enctype="multipart/form-data">
                <table class="table table-striped">
                    <tr>
                        <th>上传论文</th>
                        <td><input type="file" name="thesis" /></td>
                    </tr>
                    <tr>
                        <th>留言:</th>
                        <td><textarea rows="10" style="width: 700px;" name="comment"></textarea></td>
                    </tr>
                </table>
                <div class="form-actions pull-right">
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="button" class="btn">取消</button>
                </div>
            </form>
        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>
</html>