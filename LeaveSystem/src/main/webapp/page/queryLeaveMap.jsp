<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>动态流程图</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">



</head>
<body>
	<!-- 流程图 -->
	<img style="position: absolute; top: 0px; left: 0px;"
		src="${pageContext.request.contextPath}/processDefinition/showView.action?deploymentId=${deploymentId}&diagramResourceName=${diagramResourceName}">


	<!-- 流程图中当前活动框 -->
	<div
		style="position: absolute;border:1px solid red;width: ${activity_width }px;height:${activity_height }px;top:${activity_y }px;left: ${activity_x }px;"></div>

</body>

</html>
