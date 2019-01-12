<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${pageContext.request.contextPath}/assist/getAssistListByPage?pageNo=1&pageSize=10">奖惩管理</a></li>
    <li><a href="${pageContext.request.contextPath}/assist/addAssist">添加</a></li>
    </ul>
    </div>
    <form action="${pageContext.request.contextPath}/assist/addOneAssist" method="post">
    <div class="formbody">
    <div class="formtitle"><span>奖惩记录</span></div>
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="cmid" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩分类</label><input name="type" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩内容</label><input name="sub" type="text" class="dfinput" value=""/> </li>
    <li><label>生效日期</label><input name="day" type="text" class="dfinput" value=""/> </li>
    <li><label>审批单位</label><input name="aunit" type="text" class="dfinput" value=""/> </li>
    <li><label>审批人</label><input name="aperson" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销日期</label><input name="rday" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销原因</label><input name="areason" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="remark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="attachment" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="重置"/>
    </li>
    </ul>
    </div>
    </form>
</body>

</html>
