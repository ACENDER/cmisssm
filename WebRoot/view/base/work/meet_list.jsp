<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>

    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">

        function confirmMsgDel() {
            if (confirm("删除客户信息,您确定要删除吗?"))
                window.close();
        }

        //首页
        function firstPage() {
            document.forms[0].action = "${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=1&pageSize=10";
            document.forms[0].submit();
        }

        //上一页
        function priviousPage() {
            var pageNow = eval(${meetlist.pageNo});
            if (pageNow == 1) {
                alert("已经是第一页！");
                return false;
            }
            var pageT = pageNow - 1;
            document.forms[0].action = "${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=" + pageT + "&pageSize=10";
            document.forms[0].submit();
        }

        //下一页
        function nextPage() {
            var pageNow = eval(${meetlist.pageNo});
            if (pageNow >= (eval(${meetlist.offsetSize})-1)) {
                alert("已经是最后一页！");
                return false;
            }
            var pageT = pageNow + 1;
            document.forms[0].action = "${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=" + pageT + "&pageSize=10";
            document.forms[0].submit();
        }

        //末页
        function lastPage() {
            var pageT = eval(${meetlist.offsetSize})-1;
            document.forms[0].action = "${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=" + pageT + "&pageSize=10";
            document.forms[0].submit();
        }

        //转到第几页
        function goPage() {
            var page = document.getElementById("inputpage").value;
            if (page == '') {
                alert("请输入页码");
                return false;
            }
            if (page >= eval(${meetlist.offsetSize})) {
                alert("输入页码不能大于总页数");
                return false;
            }
            if (page < 1) {
                alert("输入页码不能小于1");
                return false;
            }
            document.forms[0].action = "${pageContext.request.contextPath}/work/getMeetListByPage?pageNo=" + page + "&pageSize=10";
            document.forms[0].submit();
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

        });
    </script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">例会管理</a></li>
    </ul>
</div>
<form action="${pageContext.request.contextPath}/work/getMeetList?pageNo=1&pageSize=10" method="post">
    <div class="formbody">
        <ul class="seachform">

            <li><label>客户经理编号</label><input name="cmid" type="text" class="scinput" value=''/></li>
            <li><label>日期</label><input name="day" type="text" class="scinput" value=''/></li>
            <li><label>主题</label><input name="theme" type="text" class="scinput" value=''/></li>
            <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
        </ul>
    </div>

    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar1">
                <li><a href="${pageContext.request.contextPath}/work/addMeet"><span><img src="${pageContext.request.contextPath}/image/t01.png"/></span>添加</a></li>
               <li><a  id="editHref" onclick="return check()" href="#"><span><img src="${pageContext.request.contextPath}/image/t02.png"/></span>修改</a></li>
                <li><a id="delHref" onclick="return delcheck()" href="#"><span><img src="${pageContext.request.contextPath}/image/t03.png"/></span>删除</a></li>
            </ul>
        </div>
        <table class="tablelist" id="meetInfoList">
            <thead>
            <tr class="tablehead">
                <td colspan="11">客户信息列表</td>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><input name="" type="checkbox" value=""/></th>
                <th>编号</th>
                <th>客户经理编号</th>
                <th>日期</th>
                <th>与会人员</th>
                <th>主题</th>
                <th>附件</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty meetlist}">
                <tr>
                    <td colspan="11" align="center"><font color="red">您检索的数据不存在！</font></td>
                </tr>
            </c:if>
            <c:if test="${not empty meetlist}">
                <c:forEach var="meet" items="${meetlist.list}">
                    <tr>
                        <td><input name="" type="checkbox" value=""/></td>
                        <td>${meet.ckey}</td>
                        <td>${meet.cmid}</td>
                        <td>${meet.day}</td>
                        <td>${meet.personnel}</td>
                        <td>${meet.theme}</td>
                        <td>${meet.attachment}</td>

                    </tr>

                </c:forEach>
            </c:if>

            </tbody>
        </table>
        <div class="pagin">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="STYLE4">
                        <div class="message">共<i class="blue">${meetlist.rowCount}</i>&nbsp;条记录，当前显示第&nbsp;<i class="blue">${meetlist.pageNo}&nbsp;</i>页</div>
                    </td>
                    <td>
                        <table border="0" align="right" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="45"><img src="${pageContext.request.contextPath}/image/first.gif" width="33" height="20" style="cursor:hand" onclick="firstPage()"/></td>
                                <td width="50"><img src="${pageContext.request.contextPath}/image/back.gif" width="43" height="20" style="cursor:hand" onclick="priviousPage()"/></td>
                                <td width="50"><img src="${pageContext.request.contextPath}/image/next.gif" width="43" height="20" style="cursor:hand" onclick="nextPage()"/></td>
                                <td width="40"><img src="${pageContext.request.contextPath}/image/last.gif" width="33" height="20" style="cursor:hand" onclick="lastPage()"/></td>
                                <td width="100">
                                    <div align="center"><span class="STYLE1">转到第
                 <input name="inputpage" id="inputpage" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;"/>
                 页 </span></div>
                                </td>
                                <td width="40"><img src="${pageContext.request.contextPath}/image/go.gif" width="33" height="17" style="cursor:hand" onclick="goPage()"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
<script type="text/javascript">
    function check(){
    	// #custInfoList tr:gt(1) input:checkbox:checked 获取选中行
    	// #custInfoList 获取名为custInfoList的table下 #表示是ID选择器
    	// tr:gt(1)选择编号大于1 的TR（tr编号从0开始）
    	// input:checkbox:checked input标签属性为checkbox的已选中的行
    	var check = $(" #meetInfoList tr:gt(1) input:checkbox:checked ");
    	// check.size()选中的行数
    	if(check.size() == 0){
    		alert("请选择一行进行操作！");
    		return;
    	}else if(check.size() > 1){
    		alert("您只能选择一行进行操作！");
    		return;
    	}
    	
    	// 获取选中的第几个chkeckbox
    	// list.index()判断是在list中的第几个
    	// :eq(n)表示第n个对象 
    	var index = $("#meetInfoList tr input:checkbox").index($("#meetInfoList tr:gt(1) input:checkbox:checked:eq(0)")) + 1;
    	
    	// 获取选中行name的值
    	//children("td:rq(1)") children是获取子对象,td:rq(1)表示第一个td对象的值
    	var ckey = $(" #meetInfoList tr:eq("+index+")  ").children("td:eq(1)").text();   
    	$("#editHref").attr("href","${pageContext.request.contextPath}/work/modiMeet?ckey="+ckey);
    	return true;
    	}
 function delcheck(){
    	// 获取选中行
    	var selected = $(" #meetInfoList tr:gt(1) input:checkbox:checked ");
    	
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
    		var checkindex = $("#meetInfoList tr input:checkbox").index($(this)) + 1;
    		var ckey = $(" #meetInfoList tr:eq("+checkindex+")  ").children("td:eq(1)").text();
    		keys = keys + "," + ckey;
    	})
    	
    	$("#delHref").attr("href","${pageContext.request.contextPath}/work/delMeet?ckey="+keys);
    	return true;
    	}
</script>
</body>
</html>
