<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

        <div class="container">
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>论文名</th>
                        <th>发布人</th>
                        <th>审核</th>
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
                        <td>
                            <c:if test="${subject.checked == true}">
                                <span class="label label-success">已通过！</span>
                            </c:if>
                            <c:if test="${subject.checked != true}">
                                <span class="label label-warning">待审核</span>
                            </c:if>
                        </td>
                        <c:choose>  
                            <c:when test="${subject.student==null}">
                                <td>尚未有学生选择</td>
                                <td>
                                    <div class="btn-group">
                                        <a data-trigger="confirm" data-content="是否确认删除此论题!" class="btn  btn-warning" href="${myContext}/DeleteSubjectServlet?id=${subject.id}">删除论题</a>
                                        <a class="btn" href="${myContext}/PublishSubjectUIServlet?id=${subject.id}">修改论题</a>
                                    </div>
                                </td>
                            </c:when>  
                            <c:otherwise>
                                <td><a href="${myContext}/UserInfoServlet?userId=${subject.student.id}">${ subject.student.name}</a>   同学选择了此题
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn" href="${myContext }/ConfirmSubjectServlet?subjectId=${subject.id}" >确认选题</a>
                                        <a  class="btn " href="${myContext }/ShowThesisInfoServlet?subjectId=${subject.id}" >查看已提交的论文</a>
                                        <a class="btn" href="${myContext}/PublishSubjectUIServlet?id=${subject.id}">修改论题</a>
                                    </div>
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