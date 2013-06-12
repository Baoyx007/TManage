<%-- 
    Document   : user_info
    Created on : Jun 12, 2013, 11:15:56 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>用户信息</title>
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
            .help-block{
                color: red;
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
        <!--container-->
        <div class="container">
            <div id="legend" class="">
                <legend class="">基本信息</legend>
            </div>

            <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">用户名：</label>
                <div class="controls">
                    <input type="text" name="username" disabled="true"  value="${thisUser.username }"class="input-xlarge">
                    <a class="btn btn-success" href="javascript:;" onclick="openwin();" >发送站内信</a>
                </div>
            </div>

            <div class="control-group">

                <!-- Text input-->
                <label class="control-label"  for="input01">密码：</label>
                <div class="controls">
                    <input type="password" name="password" disabled="true" value="${thisUser.password }" class="input-xlarge">
                </div>
            </div>

            <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">姓名：</label>
                <div class="controls">
                    <input type="text" name="name" disabled="true"  value="${thisUser.name}"  class="input-xlarge">
                </div>
            </div><div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">邮件：</label>
                <div class="controls">
                    <input type="email" name="email" disabled="true" value="${thisUser.email }"  class="input-xlarge">
                </div>
            </div><div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">电话：</label>
                <div class="controls">
                    <input type="tel" name="phone" disabled="true" value="${thisUser.phone }"  class="input-xlarge">
                </div>
            </div>

            <div class="control-group">

                <!-- Textarea -->
                <label class="control-label">自我介绍：</label>
                <div class="controls">
                    <div class="textarea">
                        <textarea type=""  name="comment" disabled="true" class="" style="margin: 0px; width: 275px; height: 69px;">${thisUser.comment } </textarea>
                    </div>
                </div>
            </div>
            <c:if test="${thisUser.getClass().simpleName != 'Admin' }">
                <div class="accordion" id="accordion2">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                显示更多
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <div id="legend" class="">
                                    <legend class="">更多信息</legend>
                                </div>
                                <div class="control-group">

                                    <!-- Text input-->
                                    <label class="control-label" for="input01">学号:</label>
                                    <div class="controls">
                                        <input type="text" disabled="true" name="schoolNumber" value="${thisUser.schoolNumber }"  class="input-xlarge">
                                    </div>
                                </div>

                                <div class="control-group">

                                    <!-- Text input-->
                                    <label class="control-label" for="input01">生日：</label>
                                    <div class="icontrols"  >
                                        <input class="span2" disabled="true" size="16" type="text" name="birthday" value="${thisUser.birthday }" >
                                    </div>       
                                </div>

                                <div class="control-group">
                                    <label class="control-label">性别：</label>
                                    <div class="controls">
                                        <!-- Inline Radios -->
                                        <label class="radio inline">
                                            <input type="radio" name="gender" ${thisUser.gender== 'MALE'?'checked':''}  value="MALE">
                                            男
                                        </label>
                                        <label class="radio inline">
                                            <input type="radio" name="gender" ${thisUser.gender=='FEMALE'?'checked':''} value="FEMALE">
                                            女
                                        </label>
                                    </div>
                                </div>

                                <div class="control-group">

                                    <!-- Text input-->
                                    <label class="control-label" for="input01">地址：</label>
                                    <div class="controls">
                                        <input type="text" disabled="true" name="address" value="${thisUser.address }" placeholder="输入寝室地址" class="input-xlarge">
                                        <p class="help-block"></p>
                                    </div>
                                </div>


                                <div class="control-group">

                                    <!-- Select Basic -->
                                    <label class="control-label">学历：</label>
                                    <div class="controls">
                                        ${thisUser.qualification}
                                    </div>

                                </div>

                                <div class="control-group">

                                    <!-- Select Basic -->
                                    <label class="control-label">所属院系：</label>
                                    <div class="controls">
                                        ${thisUser.unit}
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
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
        <script type="text/javascript">
            function openwin() {
                window.open("${myContext}/MailToUserServlet?toWho=any&id=${thisUser.id}", "mail", "height=600, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");

            }
        </script>
    </body>
</html>
