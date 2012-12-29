<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>sql执行</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	
		 	<div class="row">
		 			<div class="span12">
		 				<c:if test="${obj != null }">
			 				<div class="badge badge-info">
								${obj}			 					
			 				</div>
		 				</c:if>
		 				<form action="${base }/admin/function/execsql" method="post">
		 					<table>
		 						<tbody>
		 							<tr>
		 								<td>输入验证码 :</td>
		 								<td><input  name="code"  type="password"/></td>
		 							</tr>
		 							<tr>
		 								<td> 输入sql :</td>
		 								<td><input  name="sql" /></td>
		 							</tr>
		 							<tr>
		 								<td colspan="2"><input type="submit"  value="提交"/></td>
		 							</tr>
		 						</tbody>
		 					</table>
		 					 </form>
		 			</div>
		 	</div>
</body>
</html>