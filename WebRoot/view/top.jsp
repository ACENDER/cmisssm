<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>欢迎登录客户经理信息管理系统</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
	</script>
  </head>
  
<body style="background:url(image/topbg.gif) repeat-x;">

    <div  class="topleft">
    <a href="${pageContext.request.contextPath}/login/main" target="_parent"><img src="image/logo.png" title="系统首页" /></a>
    </div>
    <div class="topright">    
    <ul>
    <li><span><img src="image/i07.png" title="论坛"  class="helpimg" height="16" width="16"/></span><a href="${pageContext.request.contextPath}/login/main" target="_parent">论坛</a></li>
    <li><span><img src="image/help.png" title="帮助"  class="helpimg"/></span><a href="${pageContext.request.contextPath}/login/main" target="_parent">帮助</a></li>
    <li><span><img src="image/i10.png" title="注销"  class="helpimg" height="16" width="16"/></span><a href="${pageContext.request.contextPath}/login/logout" target="_parent">注销</a></li>
    </ul>
     
    <div class="user">
    <span>欢迎${user}登录！</span>
    </div>   
    </div>

</body>
</html>