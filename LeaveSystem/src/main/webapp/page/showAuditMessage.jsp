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
					<td>审核id</td>
					<td>审核人</td>
					<td>审核任务信息</td>
					<td>审核内容</td>
					<td>审核状态</td>
					<td>审核时间</td>
					
				</tr>
				<c:forEach items="${auditList}" var="audit">
					<tr>
						<td class=category>${audit.leaveId}</td>
						<td class=category>${audit.userName }</td>
						<td class=category>${audit.taskName }</td>
						<td class=category>${audit.auditInfo}</td>
						<td class=category>
							<c:if test="${audit.status=='1'}">
								审核通过
							</c:if>
							<c:if test="${audit.status=='0'}">
								审核不通过
							</c:if>
						</td>
						<td class=category><fmt:formatDate value="${audit.createTime}"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
				</c:forEach>
			</TBODY>
		</TABLE>
		
</body>
</html>