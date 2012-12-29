<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<title>编辑${msg["Menu.listName"]}</title>
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
			<form action="${base }/admin/menu/update" method="post">
				<input type="hidden" name="id" value="${obj.id}"/>
				<input type="hidden" name="mtype" value="${obj.mtype}"/>
				<table style="width:100%">
					<tbody>
						<tr>
							<td >${msg["Menu.name"]}:</td>
							<td >		<input name="name" value="${obj.name}"/>
							</td>
						</tr>
						<tr>
							<td >${msg["Menu.url"]}:</td>
							<td >		<input name="url" value="${obj.url}"/>
							</td>
						</tr>
						<tr>
							<td >${msg["Menu.morder"]}:</td>
							<td >		<input name="morder" value="${obj.morder}"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="btn"  value="更新"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
						</tr>
					</tbody>
				</table>
				 </form>
		</div>
	</div>
</body>
</html>