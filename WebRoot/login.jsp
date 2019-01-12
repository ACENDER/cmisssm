<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String msg = (String) request.getSession().getAttribute("msg");
    if(msg==null){
        msg="";
    }
    request.getSession().removeAttribute("msg");
%>
<html>
<head>

    <title>欢迎光临客户经理管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <title>欢迎登录客户经理信息管理系统</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <script language="javascript">
        $(function () {
            $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            $(window).resize(function () {
                $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            })
        });
    </script>
    <script type="text/javascript">
        function login() {
            var loginName = document.forms[0].elements["loginName"];
            var loginPass = document.forms[0].elements["loginPass"];
            if (loginName.value == "" || loginPass.value == "") {
                alert("用户名或密码错误!");
                return;
            }
            document.forms[0].action = "${pageContext.request.contextPath}/login/userLogin";
            document.forms[0].submit();//提交表单
        }
    </script>
</head>

<body id="loginBody" style="background-color:#1c77ac;">
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>
<form id="loginForm" name="loginForm">
    <div class="loginbody">
        <span></span>
        <div class="loginbox">
            <ul>
                <li><input name="loginName" type="text" class="loginuser" value="admin" onclick="JavaScript:this.value=''"/></li>
                <li><input name="loginPass" type="password" class="loginpwd" value="密码" onclick="JavaScript:this.value=''"/></li>
                <b><font color="red"><%=msg%></font></b>
                <li><input name="" type="submit" class="loginbtn" value="登录" onclick="login()"/><label><input name="" type="checkbox" value="" checked="checked"/>记住密码</label></li>

            </ul>
        </div>
    </div>
</form>
</body>
</html>
