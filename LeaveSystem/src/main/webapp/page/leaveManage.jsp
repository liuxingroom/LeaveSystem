<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	function formatAction(val,row){
		if(row.status=='未提交'){
			return "<a href=\"javascript:startApply('"+row.processinstanceId+"','"+row.leaveId+"')\">提交申请</a>";
		}else if(row.status=='审核通过' || row.status=='审核未通过'){
			return "<a href=''>查看历史批注</a>";
		}
	}
	
	function openLeaveAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
	}
	
	function saveLeave(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/leave/save.action',
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.result=="1"){
					$.messager.alert("系统系统","保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统系统","保存失败！");
					return;
				}
			}
		});
	}

	/**重置对话框中的信息*/
	function resetValue(){
		$("#leaveDays").val("");
		$("#leaveReason").val("");
	}

	/**关闭对话框*/
	function closeLeaveDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function startApply(processinstanceId,leaveId){
		$.post("${pageContext.request.contextPath}/leave/startApply.action",{'processinstanceId':processinstanceId,'leaveId':leaveId},function(result){
			if(result.result=="1"){
				$.messager.alert("系统系统","请假申请提交成功，目前审核中，请耐心等待！");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统系统","请假申请提交失败，请联系管理员！");
			}
		},"json");
	}
	
	/**将请假信息归档*/
	function pigeinhole(){
		//判断有没有选中数据  入股没有选中 则提示选中数据
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length==0){
			$.messager.alert("系统提示","请选择要归档的数据！");
			return;
		}
		//获取选中的id
		var strIds=[];
		for(var i=0;i<selectRows.length;i++){
			//只能将已经结束的请假流程归档
			 if(selectRows[i].status=="未提交" || selectRows[i].status=="审核中"){
				$.messager.alert("系统提示","请选择已经结束的请假记录！");
				return;
			}
			strIds.push(selectRows[i].leaveId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要归档这<font color=red>"+selectRows.length+"</font>条数据吗?",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/leaveHis/pigeinhole.action",{ids:ids},function(result){
					if(result.result=="1"){
						$("#dg").datagrid("reload");
						$.messager.alert("系统提示","数据已经成功归档！");
					}else{
						$.messager.alert("系统提示","数据归档失败，请联系管理员！");
					}
				},"json");
			}
		});
	}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="请假管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/leave/list.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="leaveId" width="30" align="center">编号</th>
 		<th field="createTimeStr" width="80" align="center">请假日期</th>
 		<th field="leaveDays" width="30" align="center">请假天数</th>
 		<th field="leaveReason" width="200" align="center">请假原因</th>
 		<th field="status" width="40" align="center">审核状态</th>
 		<th field="processinstanceId" width="30" hidden="true" align="center">流程实例Id</th>
 		<th field="action" width="50" align="center" formatter="formatAction">操作</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
	<a href="javascript:openLeaveAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增请假单</a>
	<a href="javascript:pigeinhole()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">归档</a>
 </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 620px;height: 280px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
 
 	<form id="fm" method="post">
 		<table cellpadding="8px">
 			<tr>
 				<td>请假天数：</td>
 				<td>
 					<input type="text" id="leaveDays" name="leaveDays" class="easyui-numberbox" required="true"/>
 				</td>
 			</tr>
 			<tr>
 				<td valign="top">请假原因：</td>
 				<td>
 					<%-- <input type="hidden" name="user.id" value="${currentMemberShip.user.id }"/> --%>
 					<!-- <input type="hidden" name="status" value="未提交"/> -->
 					<textarea type="text" id="leaveReason" name="leaveReason"  rows="5" cols="49" class="easyui-validatebox" required="true"></textarea>
 				</td>
 			</tr>
 		</table>
 	</form>
 
</div>

<div id="dlg-buttons">
	<a href="javascript:saveLeave()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeLeaveDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

</body>
</html>