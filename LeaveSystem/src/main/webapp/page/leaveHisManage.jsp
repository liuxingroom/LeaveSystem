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


	/**取消归档*/
	function pigeouthole(){
		//判断有没有选中数据  入股没有选中 则提示选中数据
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		//获取选中的id
		var strIds=[];
		for(var i=0;i<selectRows.length;i++){
			//只能将已经结束的请假流程归档
			/* if(selectRows[i].status=="未提交" || selectRows[i].status=="审核中"){
				$.messager.alert("系统提示","请选择已经结束的请假记录！");
				return;
			} */
			strIds.push(selectRows[i].leaveId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要取消归档这<font color=red>"+selectRows.length+"</font>条数据吗?",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/leaveHis/pigeouthole.action",{ids:ids},function(result){
					if(result.result=="1"){
						$("#dg").datagrid("reload");
						$.messager.alert("系统提示","数据已经成功取消归档！");
					}else{
						$.messager.alert("系统提示","数据取消归档失败，请联系管理员！");
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
  url="${pageContext.request.contextPath}/leaveHis/list.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="leaveId" width="30" align="center">编号</th>
 		<th field="createTimeStr" width="80" align="center">请假日期</th>
 		<th field="leaveDays" width="30" align="center">请假天数</th>
 		<th field="leaveReason" width="200" align="center">请假原因</th>
 		<th field="status" width="40" align="center">审核状态</th>
 		<th field="processinstanceId" width="30" hidden="true" align="center">流程实例Id</th>
 		<!-- <th field="action" width="50" align="center" formatter="formatAction">操作</th> -->
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
	<a href="javascript:pigeouthole()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">取消归档</a>
 </div>
</div>



</body>
</html>