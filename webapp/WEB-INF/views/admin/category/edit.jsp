<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>修改类别</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row">
		 			<div class="span12">
		 				<form action="${base }/admin/category/update" method="post">
		 					<input type="hidden" name="id" value="${obj.id }"/>
		 					<table>
		 						<tbody>
		 							<tr>
		 								<td>名称:</td>
		 								<td><input  name="name" value="${obj.name }"/></td>
		 							</tr>
		 							<tr>
		 								<td colspan="2"><input type="submit" class="btn"  value="更新"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
		 							</tr>
		 						</tbody>
		 					</table>
		 					 </form>
		 			</div>
		 	</div>
</body>
</html>