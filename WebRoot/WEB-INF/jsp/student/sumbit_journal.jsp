<%-- 
    Document   : sumbit_journal
    Created on : May 31, 2013, 2:56:42 PM
    Author     : Haven
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
        <script>
            function show_header(n)
            {
                for (var i = 1; i <=${fn:length(myJournals)}; i++) {
                    document.getElementById('headerdiv' + i).style.display = 'none';
                    document.getElementById('arrowraquo'+i).style.background = '';
                    document.getElementById('arrowraquo'+i).style.color = '#333333';
                    document.getElementById('arrowhr'+i).style.background = '#d4d4d4';
                }
                document.getElementById('arrowraquo' + n).style.background = '#ff4800';
                document.getElementById('arrowraquo' + n).style.color = '#ffffff';
                document.getElementById('arrowhr' + n).style.background = '#ff4800';
                document.getElementById('headerdiv' + n).style.display = 'block';
            }
        </script>
        <style type="text/css">
            hr
            {
                background-color:#d4d4d4;
                color:#d4d4d4;
                height:1px;
                border:0px;
                clear:both;
            }
            div
            {
                margin:0;
                padding:0;
                width:100%;
                display: block;
            }
            .arrowdiv
            {
                cursor:pointer;
            }
            .arrowraquo
            {
                font-weight:bold;color:#333333;
            }
            #maincolumn
            {
                font-size:13px;
                padding-bottom:8px;
                padding-left:4px;
                float:left;
                padding-right:5px;
                margin-left:  10%;
                width: 1000px;
            }
            #maincolumn a:link,#maincolumn a:visited {text-decoration:none;color:#404040;background-color:transparent}
            #maincolumn a:hover,#maincolumn a:active {text-decoration:underline;color:#404040;background-color:transparent}
        </style>
    </head>
    <body>
        第一次进来:显示管理员 的公告（周志），<hr>
        以后进来显示进度条<br><br><br>
        <div id="maincolumn">
            <div  >
                <div style="margin-top:3px;margin-left:3px;">
                    <div class="arrowdiv" style="float:left;width:165px;" onclick="show_header(1);">
                        <div id="arrowraquo1" class="arrowraquo" style="float: left; width: 13px; height: 18px; font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(255, 72, 0); background-position: initial ; background-repeat: initial;">
                            »</div>
                        <div style="margin-left:2px;"><hr id="arrowhr1" class="arrowhr" style="width: 145px; border: 0px; height: 1px; background-color: rgb(255, 72, 0); color: rgb(255, 72, 0); position: relative; bottom: 10px; left: 3px; background-position:  initial; background-repeat:  initial;"></div>
                        <div style="position:relative;bottom:4px;left:5px;float:left;text-align:center;color:#888888;font-weight:bold;font-family:arial;"><div>
                                第一周</div></div>
                    </div>
                    <div class="arrowdiv" style="float:left;width:165px;" onclick="show_header(2);">
                        <div id="arrowraquo2" class="arrowraquo" style="float: left; width: 13px; font-weight: bold; color: rgb(51, 51, 51);">
                            »</div>
                        <div style="margin-left:2px;"><hr id="arrowhr2" class="arrowhr2" style="width: 145px; border: 0px; height: 1px; position: relative; bottom: 9px; left: 3px; background-color: rgb(212, 212, 212); background-position: initial ; background-repeat: initial ;"></div>
                        <div style="position:relative;bottom:4px;left:5px;float:left;text-align:center;color:#888888;font-weight:bold;font-family:arial;"><div>
                                第二周</div></div>
                    </div>
                    <div class="arrowdiv" style="float:left;width:165px;" onclick="show_header(3);">
                        <div id="arrowraquo3" class="arrowraquo" style="float: left; width: 13px; font-weight: bold; color: rgb(51, 51, 51);">
                            »</div>
                        <div style="margin-left:2px;"><hr id="arrowhr3" class="arrowhr3" style="width: 145px; border: 0px; height: 1px; position: relative; bottom: 9px; left: 3px; background-color: rgb(212, 212, 212); background-position: initial ; background-repeat:  initial;"></div>
                        <div style="position:relative;bottom:4px;left:5px;float:left;text-align:center;color:#888888;font-weight:bold;font-family:arial;"><div>
                                第三周</div></div>
                    </div>
                    <div style="clear:both"></div>
                </div>
                <c:forEach items="${myJournals}" var="journal" varStatus="status">
                    <div id="headerdiv${status.count}" style="display: block;">
                        <h1>${journal.topic}</h1>
                        <div style="height:100px;">
                            ${journal.content}
                            <div style="margin-top:7px;width:350px;">
                                <a style="font-weight:bold;" href="#">
                                    修改<span style="background:#ffffff;color:#ff4800"> »</span></a>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${empty journal.teacher}">老师尚未评价</c:when>
                            <c:otherwise>   <h2>老师评语:  </h2><div> ${journal.opinion}</div>
                                <div><strong>${journal.teacher.name}-${journal.reviewDate}</strong></div></c:otherwise>
                        </c:choose>

                        <div style="clear:both;"></div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div>   <a href="${pageContext.servletContext.contextPath}/">返回首页</a> </div>

    </body>
</html>
