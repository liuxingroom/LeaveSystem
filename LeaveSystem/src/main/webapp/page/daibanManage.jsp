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
			"s_name":$("#s_name").val()
		});
	}

	function formatAction(val,row){
		var userId=$("#userId").val();
		return "<a href=\"javascript:claimTask('"+row.id+"','"+userId+"')\">拾取任务</a>";
		
	}
	
	/**拾取任务*/
	function claimTask(taskId,userId){
		$.post("${pageContext.request.contextPath}/task/claimTask.action",{taskId:taskId,userId:userId},function(result){
			if(result.result=="1"){//如果储存在同名的用户
				$("#dg").datagrid("reload");
				$.messager.alert("任务拾取","拾取任务成功");
			}else{
				$.messager.alert("任务拾取","任务拾取失败");
			}
		},"json");
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="待办任务管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/task/list.action?userId=${userId}&flag=0" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="id" width="100" align="center">任务ID</th>
 		<th field="name" width="100" align="center">任务名称</th>
 		<th field="createTimeStr" width="100" align="center">创建时间</th>
 		<th field="action" width="100" align="center" formatter="formatAction">操作</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
 	&nbsp;任务名称&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchTask()"/>
 	<a href="javascript:searchTask()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	<input type="hidden" id="userId" value="${userId} "/>
 </div>
</div>

</body>
</html>