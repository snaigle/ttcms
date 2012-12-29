<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
<head>
<title>查看${msg["Menu.listName"]}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="adminmain">
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<c:if test="${message != null }">
 				<div class="badge badge-info">
					${message}			 					
 				</div>
			</c:if>
				<table style="width:100%">
					<tbody>
						<tr>
							<td >${msg["Menu.name"]}:</td>
							<td >${obj.name}</td>
						</tr>
						<tr>
							<td >${msg["Menu.url"]}:</td>
							<td >${obj.url}</td>
						</tr>
						<tr>
							<td >${msg["Menu.mtype"]}:</td>
							<td >${obj.mtype}</td>
						</tr>
						<tr>
							<td >${msg["Menu.morder"]}:</td>
							<td >${obj.morder}</td>
						</tr>
						<tr>
						
							<td colspan="2" align="center"><a href="${base}/admin/menu/edit?id=${obj.id}"" class="btn">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
						
						</tr>
					</tbody>
				</table>
		</div>
	</div>
</body>
</html>