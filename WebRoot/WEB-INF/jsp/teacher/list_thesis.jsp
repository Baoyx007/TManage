<%-- 
    Document   : list_thesis
    Created on : May 30, 2013, 5:20:51 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>待审阅论文</title>
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
            <div class="page-header"><h1>待审阅论文列表</h1></div>
            <c:choose>
                <c:when  test="${empty requestScope.unreadedThesises}">
                    占无未审阅的论文!<br>
                    <a href="${pageContext.servletContext.contextPath }/">返回首页</a>
                </c:when>
                <c:otherwise>
                    <div class="accordion" id="accordion2">
                        <c:forEach items="${requestScope.unreadedThesises}" var="thesis" varStatus="status">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${status.count}">
                                        ${thesis.subject.title}——${thesis.realFileName}
                                    </a>
                                    <c:if test="${thesis.id==archiveThesis.id}"><span class="label label-success pull-right">终稿</span></c:if>
                                    </div>
                                    <div id="collapse${status.count}" class="accordion-body collapse in">
                                    <div class="accordion-inner">
                                        <h4>论文描述：</h4>
                                        <div>${thesis.subject.description}</div>
                                        <br>
                                        <span class="label label-info">学生:</span>
                                        <a> ${thesis.subject.student.name}</a>
                                        <br>
                                        提交日期： <fmt:formatDate type="both" dateStyle="default" timeStyle="default" 
                                                        value="${thesis.submitDate}"/><br>
                                        <div style="float: left;width: 40%;">学生留言：  <textarea readonly="true"  style="width: 250px;height: 100px;"  > ${thesis.studentComment}</textarea></div>
                                        <form action="${myContext }/SubmitTeacherCommentServlet" method="post" >
                                            <input type="hidden" name="thesisId" value="${thesis.id}">
                                            <div>老师评语：<textarea id="teacherComment" name="teacherComment" style="width: 250px;height: 100px;" > ${thesis.teacherComment}</textarea></div>
                                            <br><br>
                                            <div class="btn-group">
                                                <a class="btn" href="${downloadURL}">下载</a><a class="btn" href="${pageContext.servletContext.contextPath }/SubmitThesisUIServlet?subjectId=${thesis.subject.id}">上传已审阅的论文</a>
                                                <input class="btn btn-primary" type="submit" value="提交评语"/>
                                            </div>
                                        </form>
                                        <c:url var="downloadURL" value="/DownloadThesisServlet">
                                            <c:param name="uuidFilePath" value="${thesis.realFilePath}">
                                            </c:param>
                                            <c:param name="uuidFileName" value="${thesis.uuidFileName}">
                                            </c:param>
                                        </c:url>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.js"></script>
        <script type="text/javascript">
                                        function openwin() {
                                            window.open("${myContext}/MailToUserServlet?toWho=MyTeacher", "mail", "height=600, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");

                                        }
        </script>
    </body>
</html>
