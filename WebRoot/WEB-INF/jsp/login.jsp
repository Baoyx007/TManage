<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登陆</title>
        <!-- Le styles -->
        <link href="./css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
                background: #0d7bd5 url('./img/glow.png') no-repeat center center;
                color: rgba(255, 255, 255, .8);
            }
            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
            }
        </style>
        <link href="./css/bootstrap-responsive.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <br> <div class="container" align="center">
            <img src="img/title.png" />   </div>
        <br>
        <br>
        <br>
        <div class="container">
            <form class="form-signin" action="${pageContext.servletContext.contextPath }/LoginServlet"
                  method="post">
                <input type="text" class="input-block-level" name="username" placeholder="用户名">
                <input type="password" class="input-block-level" name="password" placeholder="密码">
                <label class="checkbox">
                    <input type="checkbox" value="remember-me"> 记住我
                </label>
                <button class="btn  btn-primary" type="submit">登陆</button>
            </form>

        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="./bootstrap/js/jquery.js"></script>
        <script src="./bootstrap/js/bootstrap.js"></script>
    </body>
</html>