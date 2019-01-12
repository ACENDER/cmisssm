<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.inspur.cmis.base.assist.model.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
		
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>
<%
	AssistBean assist = (AssistBean)request.getAttribute("assist");
 %>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${pageContext.request.contextPath}/assist/getAssistListByPage?pageNo=1&pageSize=10">例会管理</a></li>
    <li><a href="${pageContext.request.contextPath}/assist/modiassist">修改</a></li>
    </ul>
    </div>
    
    <form action="${pageContext.request.contextPath}/assist/editAssist" method="post">
    <div class="formbody">
    <div class="formtitle"><span>例会管理</span></div>
    
    <ul class="forminfo">
     <li><label>编号</label><input name="ckey" type="text" class="dfinput" value="<%=assist.getCkey() %>" readonly="readonly"/></li>
    <li><label>客户经理编号</label><input name="cmid" type="text" class="dfinput" value="<%=assist.getCmid() %>"/></li>
    <li><label>奖惩分类</label><input name="type" type="text" class="dfinput" value="<%=assist.getType()%>"/> </li>
    <li><label>奖惩内容</label><input name="sub" type="text" class="dfinput" value="<%=assist.getSub()%>"/> </li>
    <li><label>生效日期</label><input name="day" type="text" class="dfinput" value="<%=assist.getDay()%>"/> </li>
    <li><label>审批单位</label><input name="aunit" type="text" class="dfinput" value="<%=assist.getAunit()%>"/> </li>
    <li><label>审批人</label><input name="aperson" type="text" class="dfinput" value="<%=assist.getAperson()%>"/> </li>
    <li><label>撤销日期</label><input name="rday" type="text" class="dfinput" value="<%=assist.getRday()%>"/> </li>
    <li><label>撤销原因</label><input name="areason" type="text" class="dfinput" value="<%=assist.getAreason()%>"/> </li>
    <li><label>备注</label><input name="remark" type="text" class="dfinput" value="<%=assist.getRemark()%>"/> </li>
    <li><label>附件上传</label><input name="attachment" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="${pageContext.request.contextPath}/assist/getAssistListByPage?pageNo=1&pageSize=10"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
