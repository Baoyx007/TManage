<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
    <head>
        <title>消息</title>
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
        <div class="container">
            <div class="span9">
                <div class="alert alert-info alert-block">
                    <a class="close">×</a>
                    <h4 class="alert-heading"> 提示： </h4>   ${message }
                </div>
            </div>
            <dir style="clear: both"/>
            <br>
            <a class="btn btn-primary btn-large" href="${pageContext.servletContext.contextPath}/" >首页</a>
        </div>
    </body>
</html>
