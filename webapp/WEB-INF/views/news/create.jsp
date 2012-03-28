<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>增加文章</title>
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
		 				<form action="${base }/news/save" method="post">
		 					<table>
		 						<tbody>
		 							<tr>
		 								<td>标题:</td>
		 								<td><input  name="title" /></td>
		 							</tr>
		 							<tr>
		 								<td>标签:</td>
		 								<td><input  name="tags" /></td>
		 							</tr>
		 							<tr>
		 								<td>分类:</td>
		 								<td><input  name="cats" /></td>
		 							</tr>
		 							<tr>
		 								<td> 内容:</td>
		 								<td><textarea name="content" rows="10" cols="30"></textarea>  </td>
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