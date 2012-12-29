<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
<head>
<title>查看${msg["Orders.listName"]}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="yaopinmain">
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
							<td >${msg["Orders.name"]}:</td>
							<td >${obj.name}</td>
						</tr>
						<tr>
							<td >${msg["Orders.num"]}:</td>
							<td >${obj.num}</td>
						</tr>
						<tr>
							<td >${msg["Orders.address"]}:</td>
							<td >${obj.address}</td>
						</tr>
						<tr>
							<td >${msg["Orders.zip"]}:</td>
							<td >${obj.zip}</td>
						</tr>
						<tr>
							<td >${msg["Orders.phone"]}:</td>
							<td >${obj.phone}</td>
						</tr>
						<tr>
							<td >${msg["Orders.mobile"]}:</td>
							<td >${obj.mobile}</td>
						</tr>
						<tr>
							<td >${msg["Orders.fahuo"]}:</td>
							<td >${obj.fahuo}</td>
						</tr>
						<tr>
							<td >${msg["Orders.con"]}:</td>
							<td >${obj.con}</td>
						</tr>
						<tr>
							<td >${msg["Orders.email"]}:</td>
							<td >${obj.email}</td>
						</tr>
						<tr>
							<td >${msg["Orders.qq"]}:</td>
							<td >${obj.qq}</td>
						</tr>
						<tr>
							<td >${msg["Orders.memo"]}:</td>
							<td >${obj.memo}</td>
						</tr>
						<tr>
							<td >${msg["Orders.state"]}:</td>
							<td >${obj.state}</td>
						</tr>
						<tr>
						
							<td colspan="2" align="center"><a href="${base}/orders/edit?id=${obj.id}"" class="btn">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
						
						</tr>
					</tbody>
				</table>
		</div>
	</div>
</body>
</html>