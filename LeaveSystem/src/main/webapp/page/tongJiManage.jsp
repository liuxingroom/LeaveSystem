<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假记录统计</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	/**查询用户信息*/
	function searchUser(){
		$("#dg").datagrid('load',{
			"userName":$("#s_id").val()
		});
	}

	/**弹出对话框*/
	function openAuthDiglog(){
		var selectRows=$("#dg").datagrid("getSelections");
		console.log(selectRows);
		if(selectRows.length!=1){
			$.messager.alert("系统提示","请选择一条要设置的用户！");
			return;
		}
		var row=selectRows[0];
		$("#dlg").dialog("open").dialog("setTitle","设置用户权限");
		loadAllGroups(); // 加载所有角色
		setRoles(selectRows[0].userId);
		url="${pageContext.request.contextPath}/memberShip/update.action?userId="+selectRows[0].userId;
	}
	
	/**在对话框中对该用户所属的角色回显*/
	function setRoles(userId){
		$.post("${pageContext.request.contextPath}/group/findGroupByUserId.action",{userId:userId},function(result){
			var groups=result.dataObject;
			console.log(groups)
			var groupsArr=groups.split(",");
			for(var i=0;i<groupsArr.length;i++){
				$("[value="+groupsArr[i]+"]:checkbox").attr("checked",true);
			}
		},"json");
	}
	
	/**加载所有的角色*/
	function loadAllGroups(){
		$.post("${pageContext.request.contextPath}/group/listAllGroups.action",{},function(result){
			var groupList=result.dataObject;
			$("#groupsList").empty();
			for(var key in groupList){
				var cbStr='<input type="checkbox" name="groupId" value="'+groupList[key].id+'" />'+'<font>'+groupList[key].name+'</font>'+'&nbsp;';
				$("#groupsList").append(cbStr);
			}
		},"json");
	}
	
	/**关闭对话框*/
	function closeAuthDialog(){
		$("#dlg").dialog("close");
	}
	
	/**保存按钮点击事件     保存修改的角色*/
	function saveAuth(){
		var obj=document.getElementsByName("groupId");
		var s='';
		for(var i=0;i<obj.length;i++){
			if(obj[i].checked){
				s+=obj[i].value+',';
			}
		}
		$.post(url,{groupsIds:s.substring(0,s.length-1)},function(result){
			if(result.result=="1"){
				$.messager.alert("系统提示","提交成功！");
				closeAuthDialog();
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","提交失败，请联系管理员！");
			}
		},"json");
	}

</script>
</head>
<body style="margin: 1px">
<table id="dg" title="权限管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/user/listWithGroups.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="userId" width="80" align="center">权限id</th>
 		<th field="userName" width="50" align="center">用户名</th>
 		<th field="password" width="80" align="center" >密码</th>
 		<!-- <th field="password" width="80" align="center"  hidden="true">密码</th> -->
 		<th field="email" width="100" align="center">邮箱</th>
 		<th field="groups" width="150" align="center">拥有权限</th>
 	</tr>
 </thead>
</table>
<div id="tb">
 <div>
	<a href="javascript:openAuthDiglog()" class="easyui-linkbutton" iconCls="icon-power" plain="true">用户权限设置</a>
 </div>
 <div>
 	&nbsp;用户名&nbsp;<input type="text" id="s_id" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 	<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 450px;height: 200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
 
 	<div id="groupsList" style="padding: 10px"></div>
 
</div>

<div id="dlg-buttons">
	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeAuthDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>