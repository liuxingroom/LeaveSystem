<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	/**删除角色信息*/
	function deleteGroup(){
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectRows.length;i++){
			strIds.push(selectRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectRows.length+"</font>条数据吗?",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/group/delete.action",{ids:ids},function(result){
					if(result.result=="1"){
						$.messager.alert("系统提示","数据已经成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败，请联系管理员！");
					}
				},"json");
			}
		});
	}
	
	/**弹出添加对话框*/
	function openGroupAddDiglog(){
		/*将填写框中的信息制空*/
		resetValue();
		$("#dlg").dialog("open").dialog("setTitle","添加角色信息");
		$("#flag").val(1);
		$("#id").attr("readonly",false);
	}
	
	/**弹出修改对话框*/
	function openGroupModifyDiglog(){
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑角色信息");
		$("#fm").form("load",row);
		$("#flag").val(2);
		$("#id").attr("readonly",true);
	}
	
	/**校验数据（角色名和角色id）*/
	function checkData(){
		if($("#name").val()==''){
			$.messager.alert("系统系统","请输入角色名！");
			$("#name").focus();
			return;
		}
		var flag=$("#flag").val();
		if(flag==1){
			//判断角色id是否存在
			$.post("${pageContext.request.contextPath}/group/existGroupID.action",{id:$("#id").val()},function(result){
				if(result.result=="1"){
					$.messager.alert("系统系统","该角色id已存在，请更换下！");
					$("#id").focus();
				}else{
					//判断角色名是否存在
					$.post("${pageContext.request.contextPath}/group/existGroupName.action",{groupName:$("#name").val()},function(result){
						if(result.result=="1"){
							$.messager.alert("系统系统","该角色名已存在，请更换下！");
							$("#name").focus();
						}else{
							saveGroup();
						}
					},"json");
				}
			},"json");
		}else{
			saveGroup();
		}
	}
	
	function saveGroup(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/group/save.action',
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
	
	function resetValue(){
		$("#id").val("");
		$("#name").val("");
	}
	
	function closeGroupDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="角色管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/group/list.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="id" width="80" align="center">角色id</th>
 		<th field="name" width="80" align="center">角色名称</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
	<a href="javascript:openGroupAddDiglog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
	<a href="javascript:openGroupModifyDiglog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<a href="javascript:deleteGroup()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 600px;height: 150px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
 
 	<form id="fm" method="post">
 		<table cellpadding="8px">
 			<tr>
 				<td>角色id：</td>
 				<td>
 					<input type="text" id="id" name="id"  class="easyui-validatebox" required="true"/>
 				</td>
 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 				<td>角色名称：</td>
 				<td>
 					<input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>
 					<input type="hidden" id="flag" name="flag"/>
 				</td>
 			</tr>
 		</table>
 	</form>
 
</div>

<div id="dlg-buttons">
	<a href="javascript:checkData()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeGroupDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>