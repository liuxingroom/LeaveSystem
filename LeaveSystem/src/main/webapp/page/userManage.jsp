<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	function searchUser(){
		$("#dg").datagrid('load',{
			"userName":$("#s_id").val()
		});
	}
	
	function deleteUser(){
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		console.log(selectRows)
		for(var i=0;i<selectRows.length;i++){
			strIds.push(selectRows[i].userId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectRows.length+"</font>条数据吗?",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/user/delete.action",{ids:ids},function(result){
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
	function openUserAddDiglog(){
		/**将弹出框中的信息制空*/
		resetValue();
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		$("#flag").val(1);
		$("#id").attr("readonly",true);
	}
	
	/**弹出修改对话框*/
	function openUserModifyDiglog(){
		var selectRows=$("#dg").datagrid("getSelections");
		if(selectRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		$("#fm").form("load",row);
		$("#flag").val(2);
		$("#id").attr("readonly",true);
	}
	
	
	function checkData(){
		/* if($("#id").val()==''){
			$.messager.alert("系统系统","请输入用户名！");
			$("#id").focus();
			return;
		} */
		var flag=$("#flag").val();
		if(flag==1){
			$.post("${pageContext.request.contextPath}/user/existUserName.action",{userName:$("#userName").val()},function(result){
				if(result.result=="1"){//如果储存在同名的用户
					$.messager.alert("系统系统","该用户名已存在，请更换下！");
					$("#userName").focus();
				}else{
					saveUser();
				}
			},"json");
		}else{
			saveUser();
		}
	}
	
	/**用户保存*/
	function saveUser(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/user/save.action',
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
	
	/**重置对话框中的数据*/
	function resetValue(){
		$("#id").val("");
		$("#password").val("");
		$("#userName").val("");
		$("#email").val("");
	}
	
	/**关闭对话框*/
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="用户管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/user/list.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="userId" width="80" align="center">用户id</th>
 		<th field="userName" width="80" align="center">用户名</th>
 		<th field="password" width="80" align="center">密码</th>
 		<!-- <th field="firstName" width="50" align="center">姓</th>
 		<th field="lastName" width="50" align="center">名</th> -->
 		<th field="email" width="100" align="center">邮箱</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
	<a href="javascript:openUserAddDiglog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
	<a href="javascript:openUserModifyDiglog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 </div>
 <div>
 	&nbsp;用户名&nbsp;<input type="text" id="s_id" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 	<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 620px;height: 250px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
 
 	<form id="fm" method="post">
 		<table cellpadding="8px">
 			<tr>
 				<td>用户id：</td>
 				<td>
 					<input type="text" id="id" name="userId"  required="true"/>
 				</td>
 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 				<td>用户名：</td>
 				<td>
 					<input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/>
 				</td>
 			</tr>
 			<tr>
 				<td>密码：</td>
 				<td>
 					<input type="text" id="password" name="password" class="easyui-validatebox" required="true"/>
 				</td>
 				
 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 				<td>邮箱：</td>
 				<td colspan="4">
 					<input type="text"  id="email" name="email" class="easyui-validatebox" validType="email" required="true"/>
 					<input type="hidden" id="flag" name="flag"/>
 				</td>
 			</tr>
 			
 		</table>
 	</form>
 
</div>

<div id="dlg-buttons">
	<a href="javascript:checkData()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>