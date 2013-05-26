<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册</title>
        <script type="text/javascript"
        src="${pageContext.servletContext.contextPath }/js/Calendar3.js"></script>

        <link rel="stylesheet"
              href="${pageContext.servletContext.contextPath }/css/register.css"
              type="text/css"></link>
    </head>

    <body>
        <h1>注册</h1>
        <form method="post"
              action="${pageContext.servletContext.contextPath }/servlet/RegisterServlet">
            <table style="margin-left :35%;">
                <tr>
                    <td>&nbsp;用户名:</td>
                    <td>&nbsp;<input type="text" name="username"
                                     value="${form.username }"><span>${form.errors.username
                            }</span>
                    </td>
                    <td class="tip">3到8位英文字符或数字</td>
                </tr>
                <tr>
                    <td>&nbsp;密码:</td>
                    <td>&nbsp;<input type="password" name="password"><span>${form.errors.password
                            }</span>
                    </td>
                    <td class="tip">3到8位英文字符或数字</td>
                </tr>
                <tr>
                    <td>&nbsp;确认密码:</td>
                    <td>&nbsp;<input type="password" name="password2"><span>${form.errors.password2}</span>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;性别</td>
                    <td><input ${form.gender== 'MALE'?'checked':''} type="radio"
                                                                    name="gender" value="MALE" />男 <input ${form.gender==
                                                                                                            'FEMALE'?'checked':''} type="radio" name="gender" value="FEMALE" />女</td>
                </tr>
                <tr>
                    <td>&nbsp;Email: </td>
                    <td>&nbsp;<input type="text" name="email"
                                     value="${form.email }"><span>${form.errors.email
                            }</span>
                    </td>
                    <td class="tip">3到8位英文字符或数字</td>
                </tr>
                <tr><td colspan="3"><div></div></td></tr>
                <tr>
                    <td>&nbsp;姓名:</td>
                    <td>&nbsp;<input type="text" name="name"
                                     value="${form.name}"><span>${form.errors.name
                            }</span></td>
                </tr>
                <tr>
                    <td>&nbsp;生日:</td>
                    <td>&nbsp;<input type="text" name="birthday"
                                     onclick="new Calendar().show(this);" value="${form.birthday }"><span>${form.errors.birthday
                            }</span></td>
                </tr>
                <tr>
                    <td>&nbsp;电话：</td>
                    <td>&nbsp;<input type="text" name="phone"
                                     value="${form.phone }"><span>${form.errors.phone
                            }</span>
                    </td>
                    <td class="tip">3到8位英文字符或数字</td>
                </tr>
                <tr>
                    <td>&nbsp;自我描述：</td>
                    <td>&nbsp;<textarea name="comment" rows="10">${form.comment }</textarea><span>${form.errors.comment
                            }</span>
                    </td>
                    <td class="tip">3到8位英文字符或数字</td>
                </tr>
                <tr>
                    <td>&nbsp;用户类型</td>
                    <td><input ${form.userType== 'student'?'checked':''} type="radio"
                                                                         name="userType" value="student" />学生

                        <input ${form.userType==
                                 'teacher'?'checked':''} type="radio" name="userType" value="teacher" />老师
                        <input ${form.userType==
                                 'admin'?'checked':''} type="radio" name="userType" value="admin" />管理员</td>
                </tr>
                <tr>
                    <td>&nbsp;<input class="button" type="reset" value="重置"
                                     name="reset"></td>
                    <td><input type="submit" class="button" value="注册"></td>
                </tr>
            </table>
        </form>
    </body>
</html>