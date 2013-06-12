<%-- 
    Document   : login2
    Created on : Jun 4, 2013, 2:19:01 AM
    Author     : Haven
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <title>登陆</title>
        <meta charset="utf-8">
        <meta name="description" content="毕设">
        <meta name="author" content="haven">
        <!-- Le styles -->

        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <script src="./js/behavior.js"></script>
        <link href="./css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/typica-login.css">
    </head>
    <body>
        <div class=" navbar navbar-fixed-top">
            <div class="navbar-inner">
                <a class="nav pull-left" href="index.jsp"><img src="./img/logo.png" alt="毕设管理"></a>
            </div>
        </div>

        <div class="container">
            <div id="login-wraper">
                <form class="form login-form" action="${myContext}/LoginServlet" method="post">
                    <legend><span class="blue">登陆</span></legend>

                    <div class="body">
                        <label>用户名</label>
                        <input type="text" name="username">

                        <label>密码</label>
                        <input type="password"  name="password">
                    </div>

                    <div class="footer">
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1"> 记住我
                        </label>

                        <button type="submit" class="btn btn-success">登陆</button>
                    </div>

                </form>
            </div>

        </div>

        <footer class="white navbar-fixed-bottom">
            账户出错？<a href="${myContext}/ConnectAdminByMailUIServlet" class="btn btn-black">联系管理员 </a>
        </footer>


        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="./js/jquery.js"></script>
        <script src="./js/backstretch.min.js"></script>
        <script src="./js/typica-login.js"></script>


        <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 361px; width: 1349px; z-index: -999999; position: fixed;"><img src="./img/bg2.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1349px; height: 758.4421669106881px; max-width: none; z-index: -999999; left: 0px; top: -198.72108345534406px;"></div>
    </body>
</html>
