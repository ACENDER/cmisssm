<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>
<script type="text/javascript"> 
  function oWorkPerformDel()
  {  
     if(confirm("删除年度工作业绩，您确定要删除吗？"))
        window.close();
  }
</script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 260			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">客户经理辅助信息维护</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    
    <li><a href="#tab3"class="selected">奖惩记录</a></li> 
    <li><a href="#tab1">年度工作业绩</a></li> 
    <li><a href="#tab2">证照列表</a></li> 
    <li><a href="#tab4">考核记录</a></li> 
    <li><a href="#tab5">学习培训记录</a></li> 
    <li><a href="#tab6">等级认定记录</a></li> 
    <li><a href="#tab7">工作经历</a></li> 
  	</ul>
    </div>
    
    <!--年度工作业绩  -->
  	   
    <!--证件列表  -->

    <!--奖惩记录  -->
  	<form action="${pageContext.request.contextPath}/assist/getAssistList?pageNo=1&pageSize=10" method="post">
  	    <div class="formbody">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmid" type="text" class="scinput" /></li>
		    <li><label>奖惩分类</label><input name="type" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="${pageContext.request.contextPath}/assist/addAssist""><span><img src="${pageContext.request.contextPath}/image/t01.png" /></span>添加</a></li>
	        <li><a id="editHref" onclick="return check()" href="#" ><span><img src="${pageContext.request.contextPath}/image/t02.png" /></span>修改</a></li>
	        <li><a id="delHref" onclick="return delcheck()" href="#" ><span><img src="${pageContext.request.contextPath}/image/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="assistInfoList">
	    	<thead>
		    	<tr class="tablehead"><td colspan="18">奖惩记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>编号</th>
	        <th>客户经理编号</th>
	        <th>奖惩分类</th>
	        <th>奖惩内容</th>
	        <th>生效日期</th>
	        
	        <th>审批单位</th>
	        <th>审批人</th>
	        <th>撤销日期</th>
	        <th>撤销原因</th>
	        <th>备注</th>
	        
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:if test="${empty assistlist}">
                <tr>
                    <td colspan="11" align="center"><font color="red">您检索的数据不存在！</font></td>
                </tr>
            </c:if>
            <c:if test="${not empty assistlist}">
                <c:forEach var="assist" items="${assistlist.list}">
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	       <td>${assist.ckey}</td>
           <td>${assist.cmid}</td>
           <td>${assist.type}</td>
            <td>${assist.sub}</td>
            <td>${assist.day}</td>
            
            <td>${assist.aunit}</td>
            <td>${assist.aperson}</td>
            <td>${assist.rday}</td>
           <td>${assist.areason}</td>
           <td>${assist.remark}</td>
           
           <td>${assist.attachment}</td>
           <td>${assist.mday}</td>
           <td>${assist.mperson}</td>
	        </tr> 
	        </c:forEach>
	        </c:if>
	        </tbody>
	    </table>
	</div> 
	
</form>
<script type="text/javascript">
    function check(){
    	
    	var check = $(" #assistInfoList tr:gt(1) input:checkbox:checked ");
    	
    	if(check.size() == 0){
    		alert("请选择一行进行操作！");
    		return;
    	}else if(check.size() > 1){
    		alert("您只能选择一行进行操作！");
    		return;
    	}
    
    	var index = $("#assistInfoList tr input:checkbox").index($("#assistInfoList tr:gt(1) input:checkbox:checked:eq(0)")) + 1;
    	var ckey = $(" #assistInfoList tr:eq("+index+")  ").children("td:eq(1)").text();   
    	$("#editHref").attr("href","${pageContext.request.contextPath}/assist/modiAssist?ckey="+ckey);
    	return true;
    	}
 function delcheck(){
    	
    	var selected = $(" #assistInfoList tr:gt(1) input:checkbox:checked ");
    	
    	if(selected.size() == 0){
    		alert("请选择一行进行操作！");
    		return;
    	}   	
    	if(!confirm("客户信息被删除后无法恢复，是否确定删除？")){
    		return;
    	}
    	// ,1,2,3
    	var keys = "";
    	selected.each(function(){
    		var checkindex = $("#assistInfoList tr input:checkbox").index($(this)) + 1;
    		var ckey = $(" #assistInfoList tr:eq("+checkindex+")  ").children("td:eq(1)").text();
    		keys = keys + "," + ckey;
    	})
    	
    	$("#delHref").attr("href","${pageContext.request.contextPath}/assist/delAssist?ckey="+keys);
    	return true;
    	}
</script>










    <!--考核记录  -->
  	
    <!--学员培训记录  -->
  	
    <!--等级认定记录  -->
  	
    <!--工作经历  -->
  	
<script language="javascript">
	function openWindow(scanLog) {
		if (scanLog == 1) {
			document.getElementById('light1').style.display = 'block';
		}else if(scanLog == 2){
			document.getElementById('light2').style.display = 'block';
		}else if(scanLog == 3){
			document.getElementById('light3').style.display = 'block';
		}else if(scanLog == 4){
			document.getElementById('light4').style.display = 'block';
		}else if(scanLog == 5){
			document.getElementById('light5').style.display = 'block';
		}else if(scanLog == 6){
			document.getElementById('light6').style.display = 'block';
		}else if(scanLog == 7){
			document.getElementById('light7').style.display = 'block';
		}else if(scanLog == 8){
			document.getElementById('light8').style.display = 'block';
		}else if(scanLog == 9){
			document.getElementById('light9').style.display = 'block';
		}else if(scanLog == 10){
			document.getElementById('light10').style.display = 'block';
		}else if(scanLog == 11){
			document.getElementById('light11').style.display = 'block';
		}else if(scanLog == 12){
			document.getElementById('light12').style.display = 'block';
		}else if(scanLog == 13){
			document.getElementById('light13').style.display = 'block';
		}else if(scanLog == 14){
			document.getElementById('light14').style.display = 'block';
		}
	}
	function closeWindow(id) {
		document.getElementById(id).style.display = 'none';
	}
</script>
<div id="light1" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加年度工作业绩</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作年度</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作业绩</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light1')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light2" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改年度工作业绩</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>工作年度</label><input name="" type="text" class="dfinput" value="2015"/> </li>
    <li><label>工作业绩</label><input name="" type="text" class="dfinput" value="良"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light2')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light3" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加证件</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="ckey" type="text" class="dfinput" value=""/> </li>
    <li><label>证书名称</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>证书类型</label><div class="vocation"><select class="select1"><option value="0">请选择</option><option value="1" >从业资格证</option><option value="2">岗位证书</option></select></div></li>
    <li><label>证书编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>发证单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>发证时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>失效时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light3')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light4" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改证件</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>证书名称</label><input name="" type="text" class="dfinput" value="工程师"/> </li>
    <li><label>证书类型</label><div class="vocation"><select class="select1"><option value="0">请选择</option><option value="1" selected>从业资格证</option><option value="2">岗位证书</option></select></div></li>
    <li><label>证书编号</label><input name="" type="text" class="dfinput" value="092232008000912"/> </li>
    <li><label>发证单位</label><input name="" type="text" class="dfinput" value="全国计算机中心"/> </li>
    <li><label>发证时间</label><input name="" type="text" class="dfinput" value="2016-04-09"/> </li>
    <li><label>失效时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light4')"/></li>
    </ul>
    </div>
    </form>
</div>

<div id="light7" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加考核记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核内容</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核结果</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核评价</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light7')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light8" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改考核记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>考核时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>考核内容</label><input name="" type="text" class="dfinput" value="工作业绩"/> </li>
    <li><label>考核结果</label><input name="" type="text" class="dfinput" value="S"/> </li>
    <li><label>考核评价</label><input name="" type="text" class="dfinput" value="表现良好"/> </li>
    <li><label>考核单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light8')"/></li>
    </ul>
    </div>
    </form>
</div>	
<div id="light9" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加学习培训记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>培训时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>科目</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>培训单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>开始日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>结束日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>学时</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>学分</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>成绩</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light9')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light10" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改学习培训记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>培训时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>科目</label><input name="" type="text" class="dfinput" value="业务流程"/> </li>
    <li><label>培训单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li><label>开始日期</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>结束日期</label><input name="" type="text" class="dfinput" value="2016-01-10"/> </li>
    <li><label>学时</label><input name="" type="text" class="dfinput" value="10"/> </li>
    <li><label>学分</label><input name="" type="text" class="dfinput" value="2"/> </li>
    <li><label>成绩</label><input name="" type="text" class="dfinput" value="90"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light10')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light11" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加等级认定记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定级别</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定类型</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light11')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light12" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改等级认定记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>认定时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>认定级别</label><input name="" type="text" class="dfinput" value="初级会计师"/> </li>
    <li><label>认定类型</label><input name="" type="text" class="dfinput" value="初级"/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light12')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light13" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加工作经历</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>任职日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>职务</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作经历</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light13')"/></li>
    </ul>
    </div>
    </form>
</div> 
<div id="light14" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改工作经历</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>任职日期</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>职务</label><input name="" type="text" class="dfinput" value="中级客户经理"/> </li>
    <li><label>单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li><label>工作经历</label><input name="" type="text" class="dfinput" value="2010年6月--至今 贵州省分公司"/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light14')"/></li>
    </ul>
    </div>
    </form>
</div>   
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
        
    </div>

</body>

</html>
