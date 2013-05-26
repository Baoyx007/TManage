<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登陆</title>
        <style type="text/css">
            body {
                background: #0d7bd5 url('img/glow.png') no-repeat center center;
                height: 100%;
                color: rgba(255, 255, 255, .8);
                font-size: 14px;
                text-align: center;
            }

            table {
                margin: 100px auto auto auto;
            }

            .textbox {
                display: inline-block;
                width: 248px;
                padding: 10px;
                margin: 9px 0 9px;
                font-size: 14px;
                line-height: 18px;
                background: #e8f4fc;
                border: 1px solid #0d7bd5;
                color: #888;
                cursor: text;
                box-shadow: 0 1px 0 rgba(255, 255, 255, .3), 0 1px 3px rgba(0, 0, 0, .3)
                    inset;
                background-clip: padding-box;
                border-radius: 5px;
            }

            .button {
                background: #1e95e5;
                color: #b7d4ec;
                color: rgba(255, 255, 255, .8);
                box-shadow: 0 1px 0 rgba(0, 0, 0, .05), 0 1px 0 rgba(255, 255, 255, .15)
                    inset;
                border: 1px solid #147dcd;
                cursor: pointer;
                display: inline-block;
                font-size: 14px;
                line-height: 18px;
                text-shadow: 0 1px 0 rgba(0, 0, 0, .2);
                padding: 6px 15px;
                text-align: center;
                vertical-align: middle;
                border-radius: 5px;
                float: right;
                -webkit-appearance: none;
            }

            .text {
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <img src="img/title.png"></img>
        <form action="${pageContext.servletContext.contextPath }/servlet/LoginServlet"
              method="post">
            <table>
                <tr>
                    <td class="text">用户名:</td>
                    <td><input class="textbox" type="text" name="username" />
                    </td>
                </tr>
                <tr>
                    <td class="text">密码:</td>
                    <td><input class="textbox" type="password" name="password" />
                    </td>
                </tr>
                <tr>
                    <td><input class="button" type="submit" value="登陆" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>