<%-- 
    Document   : index
    Created on : Jun 1, 2013, 4:03:29 PM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
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
        <link rel="stylesheet" href="./css/grumble.css">
        <link rel="stylesheet" href="./css/scojs.css">
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
                        <form class="navbar-form pull-right" action="${myContext}/LoginServlet"
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
            <div class="hero-unit ">
                <h1>毕业设计管理系统 </h1>
                <script src="./js/jquery.js"></script>
                <script>
                    $(function() {
                        var tt = ${remain};
                        $('#countdowner').scojs_countdown({until: tt});
                    });</script>
                <br>还剩： <span id="countdowner" ></span><br><br>
                <div id="begin" data-toggle="tooltip" data-placement="left" data-original-title="${thesisStart}" class="span1">开始</div>
                <div class="progress progress-striped active span8 ">
                    <div class="bar" style="width: ${percentage}%;">${percentage}% </div>
                    <div id="percentage"></div>
                </div>
                <div id="end" data-toggle="tooltip" data-placement="top" data-original-title="${thesisEnd}" class="span1">结束</div>
                <div class="clearfix"></div>
               
            </div>

            <!-- Example row of columns -->
            <div class="row">
                <div class="span4">
                    <h2>${top2[0].topic}</h2>
                    <div  style="overflow:hidden; max-height:300px" >${top2[0].content}
                    </div>
                    <p><a class="btn" href="${myContext}/ShowBulletinUIServlet?id=${top2[0].id}">详情 &raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>${top2[1].topic}</h2>
                    <div  contenteditable="false">${top2[1].content}</div>
                    <p><a class="btn" href="${myContext}/ShowBulletinUIServlet?id=${top2[1].id}">详情 &raquo;</a></p>
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
        <script src="./js/bootstrap.js"></script>
        <script src="./js/Bubble.js"></script>
        <script src="./js/jquery.grumble.js"></script>
        <script src="./js/sco.countdown.js"></script>
        <script type="text/javascript">
                    $('#begin').tooltip();
                    $('#end').tooltip();
                    $('#percentage').grumble(
                            {
                                text: '抓紧时间了！',
                                angle: 40,
                                distance: 0,
                                showAfter: 2000,
                                hideAfter: false,
                                hasHideButton: true,
                                buttonHideText: '关闭'
                            }
                    );
        </script>
    </body>
</html>

