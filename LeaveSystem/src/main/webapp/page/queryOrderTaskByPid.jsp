<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<LINK rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.3.3/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<title>任务列表</title>

</head>
<body>

		<TABLE class="toptable grid" >
			<TBODY>
				<tr>
					<td>任务id</td>
					<td>任务名称</td>
					<td>负责人</td>
					<td>审核信息</td>
					<td>任务标识</td>
					<td>开始时间</td>
					<td>结束时间</td>
					
				</tr>
				<c:forEach items="${taskList}" var="order">
					<tr>
						<td class=category>${order.id}</td>
						<td class=category>${order.name }</td>
						<td class=category>${order.userName}</td>
						<td class=category>${order.auditMessage}</td>
						<td class=category>${order.taskDefinitionKey}</td>
						<td class=category><fmt:formatDate value="${order.createTime}"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class=category><fmt:formatDate value="${order.endTime}"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
				</c:forEach>
			</TBODY>
		</TABLE>
		
</body>
</html>