<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>增加类别</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row">
		 			<div class="span12">
		 				<form action="${base }/admin/category/save" method="post">
		 					<table>
		 						<tbody>
		 							<tr>
		 								<td>名称:</td>
		 								<td><input  name="name" /></td>
		 							</tr>
		 							<tr>
		 								<td colspan="2"><input type="submit" class="btn"  value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
		 							</tr>
		 						</tbody>
		 					</table>
		 					 </form>
		 			</div>
		 	</div>
</body>
</html>