<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<title>编辑${msg["Orders.listName"]}</title>
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
			<form action="${base }/orders/update" method="post">
				<table style="width:100%">
					<tbody>
						<tr>
							<td >${msg["Orders.name"]}:</td>
							<td >		<input name="name" value="${obj.name}"/>
						<input type="hidden" name="id" value="${obj.id}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.num"]}:</td>
							<td >		<input name="num" value="${obj.num}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.address"]}:</td>
							<td >		<input name="address" value="${obj.address}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.zip"]}:</td>
							<td >		<input name="zip" value="${obj.zip}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.phone"]}:</td>
							<td >		<input name="phone" value="${obj.phone}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.mobile"]}:</td>
							<td >		<input name="mobile" value="${obj.mobile}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.fahuo"]}:</td>
							<td >		<input name="fahuo" value="${obj.fahuo}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.con"]}:</td>
							<td >		<input name="con" value="${obj.con}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.email"]}:</td>
							<td >		<input name="email" value="${obj.email}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.qq"]}:</td>
							<td >		<input name="qq" value="${obj.qq}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.memo"]}:</td>
							<td >		<input name="memo" value="${obj.memo}"/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.state"]}:</td>
							<td >	
							<select name="state" >
									<option value="未处理" ${state=='未处理'?'selected':'' }>未处理</option>
									<option value="已发货" ${state=='已发货'?'selected':'' }>已发货</option>
									<option value="完成" ${state=='完成'?'selected':'' }>完成</option>
								</select>
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