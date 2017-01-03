<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拾取待办任务</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	var url;

	function searchTask(){
		$("#dg").datagrid('load',{
			"processInstanceId":$("#processInstanceId").val()
		});
	}

	function formatAction(val,row){
		var userId=$("#userId").val();
		return "<a href='${pageContext.request.contextPath}/task/findOrderTaskListByPid.action?processInstanceId="+row.processInstanceId+"'>查看历史任务</a>";
		
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="待办任务管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/task/queryFinishedLeave.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="userName" width="100" align="center">请假人</th>
 		<th field="leaveReason" width="100" align="center">请假理由</th>
 	    <th field="leaveDays" width="100" align="center">请假天数</th>
 		<th field="processInstanceId" width="100" align="center">流程实例id</th>
 		<th field="startTimeStr" width="100" align="center">创建时间</th>
 		<th field="endTimeStr" width="100" align="center">结束时间</th>
 		<th field="activityId" width="100" align="center">当前活动</th>
 		<th field="action" width="100" align="center" formatter="formatAction">查看历史任务</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
 	&nbsp;流程实例id&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchTask()"/>
 	<a href="javascript:searchTask()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	<input type="hidden" id="userId" value="${userId} "/>
 </div>
</div>

</body>
</html>