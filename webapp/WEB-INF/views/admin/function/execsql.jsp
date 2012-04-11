<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>sql执行</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
	</head>
<body>
		 	<div class="row">
		 			<div class="span12 red">
		 					${obj}
		 			</div>
		 	</div>
		 	<div class="row">
		 			<div class="span12">
		 				<form action="${base }/news/execsql" method="post">
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