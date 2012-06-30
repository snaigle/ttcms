<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<title>新建${msg["Orders.listName"]}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="main">
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<c:if test="${message != null }">
 				<div class="badge badge-info">
					${message}			 					
 				</div>
			</c:if>
			<form action="${base }/orders/save" method="post">
				<table style="width:100%">
					<tbody>
						<tr>
							<td >${msg["Orders.name"]}:</td>
							<td >		<input name="name" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.num"]}:</td>
							<td >		<input name="num" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.address"]}:</td>
							<td >		<input name="address" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.zip"]}:</td>
							<td >		<input name="zip" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.phone"]}:</td>
							<td >		<input name="phone" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.mobile"]}:</td>
							<td >		<input name="mobile" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.fahuo"]}:</td>
							<td >		<input name="fahuo" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.con"]}:</td>
							<td >		<input name="con" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.email"]}:</td>
							<td >		<input name="email" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.qq"]}:</td>
							<td >		<input name="qq" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.memo"]}:</td>
							<td >		<input name="memo" value=""/>
</td>
						</tr>
						<tr>
							<td >${msg["Orders.state"]}:</td>
							<td ><select name="state" >
									<option value="未处理">未处理</option>
									<option value="已发货">已发货</option>
									<option value="完成">完成</option>
								</select>
</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="btn"  value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
						</tr>
					</tbody>
				</table>
				 </form>
		</div>
	</div>
</body>
</html>