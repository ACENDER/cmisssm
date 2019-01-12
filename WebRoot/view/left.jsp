<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
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
		//导航切换
		$(".menuson li").click(function(){
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});
		
		$('.title').click(function(){
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if($ul.is(':visible')){
				$(this).next('ul').slideUp();
			}else{
				$(this).next('ul').slideDown();
			}
		});
	})	
	</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单</div>
    <dl class="leftmenu">
	    <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>客户经理信息管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/clientMgr.html" target="rightFrame">客户经理信息综合维护</a><i></i></li>
	        <li><cite></cite><a href="manager/clientMgrImport.html" target="rightFrame">批量导入</a><i></i></li>
   			<li><cite></cite><a href="${pageContext.request.contextPath}/assist/getAssistListByPage?pageNo=1&pageSize=10" target="rightFrame">客户经理辅助信息维护</a><i></i></li>
	        </ul>    
	    </dd>
	   <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>营销管理
	    </div>
	    	<ul class="menuson">  
	        <li><cite></cite><a href="${pageContext.request.contextPath}/cust/getCustListByPage?pageNo=1&pageSize=10" target="rightFrame">客户信息管理</a><i></i></li>
	        <li><cite></cite><a href="manager/marketRecord.html" target="rightFrame">营销记录管理</a><i></i></li>
	        </ul>    
	    </dd>
	   <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>日常工作管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=1&pageSize=10" target="rightFrame">例会管理</a><i></i></li>
	        <li><cite></cite><a href="manager/workMgr.html" target="rightFrame">工作管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>报表管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/clientMgrStat.html" target="rightFrame">报表管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>学习园地管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/studyMgr.html" target="rightFrame">学习园地管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="image/leftico01.png" /></span>用户管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/userInfo.html" target="rightFrame">用户管理</a><i></i></li>
	        </ul>    
	   </dd>
    
    </dl>
    
</body>
</html>
