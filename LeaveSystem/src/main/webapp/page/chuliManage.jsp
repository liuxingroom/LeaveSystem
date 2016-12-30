<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理待办任务</title>
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

	/**返回审核链接*/
	function formatAction(val,row){
		$("#taskId").val(row.id);
		$("#taskIds").val(row.id);
		return "<a href=\"javascript:Auditing()\">审核</a>";
	}
	
	/**弹出审核信息页面*/
	function Auditing(){
		$("#dlg").dialog("open").dialog("setTitle","填写审核信息");
	}
	
	
	/**拾取任务*/
	function completeTask(taskId,userId){
		$.post("${pageContext.request.contextPath}/task/completeTask.action",{taskId:taskId,userId:userId},function(result){
			if(result.result=="1"){//如果储存在同名的用户
				$("#dg").datagrid("reload");
				$.messager.alert("任务处理","处理任务成功");
			}else{
				$.messager.alert("任务处理","处理任务失败");
			}
		},"json");
	}
	
	function taskAuit(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/task/taskAuit.action',
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.result=="1"){
					var taskId=$("#taskId").val();
					alert(taskId)
					var userId=$("#userId").val();
					//提交任务
					completeTask(taskId,userId);
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统信息","提交失败！");
					return;
				}
			}
		});
	}
	
	
	/**重置对话框中的数据*/
	function resetValue(){
		$("#auditInfo").val("");
	}
	
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="处理待办任务" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/task/list.action?userId=${userId}&flag=1" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="id" width="100" align="center">任务ID</th>
 		<th field="name" width="100" align="center">任务名称</th>
 		<th field="createTime" width="100" align="center">创建时间</th>
 		<th field="action" width="100" align="center" formatter="formatAction">操作</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
 	&nbsp;任务名称&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchTask()"/>
 	<a href="javascript:searchTask()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	<input type="hidden" id="userId" value="${userId} "/>
 	<input type="hidden" id="taskId" >
 </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 620px;height: 250px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
 
 	<form id="fm" method="post">
 		<table cellpadding="8px">
 			<tr>
 				<td>审核原因：</td>
 				<td>
 					<input type="text" align="center" id="auditInfo" name="auditInfo" class="easyui-validatebox" required="true"/>
 					<input type="hidden" name="taskId" id="taskIds">
 				</td>
 			</tr>
 			<tr>
 				
 				<td>
 					通过：<input type="radio" align="center" value="1" name="status" class="easyui-validatebox" required="true" checked="checked" />
 				</td>
 				
 				
 				
 				<td >
 					不通过：<input type="radio"  align="center"  value="0" name="status" class="easyui-validatebox"  required="true"/>

 				</td>
 			</tr>
 			
 		</table>
 	</form>
 
</div>

<div id="dlg-buttons">
	<a href="javascript:taskAuit()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

</body>
</html>