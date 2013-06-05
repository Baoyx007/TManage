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
                <c:choose>
                    <c:when test="${info != null}"> 
                        <div class="alert alert-info alert-block">
                            <a class="close">×</a>
                            <h4 class="alert-heading"> 提示： </h4>   ${message }
                        </div>
                    </c:when>
                    <c:when test="${error != null}"> 
                        <div class="alert alert-error alert-block">
                            <a class="close">×</a>
                            <h4 class="alert-heading"> 错误： </h4>   ${message }
                        </div>
                    </c:when>
                    <c:when test="${success != null}"> 
                        <div class="alert alert-success alert-block">
                            <a class="close">×</a>
                            <h4 class="alert-heading"> 成功： </h4>   ${message }
                        </div>
                    </c:when>
                    <c:otherwise >
                        <div class="alert alert-danger alert-block">
                            <a class="close">×</a>
                            <h4 class="alert-heading"> 未知： </h4>   ${message }
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <dir style="clear: both"/>
            <br>
            <a class="btn btn-primary btn-large" href="${pageContext.servletContext.contextPath}/" >首页</a>
        </div>
        <script src="./js/jquery.js"></script>
    </body>
</html>
