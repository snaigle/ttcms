<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>增加文章</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row">
		 			<div class="span12">
		 				<form action="${base }/admin/news/save" method="post">
		 					<table>
		 						<tbody>
		 							<tr>
		 								<td>标题:</td>
		 								<td><input  name="title" /></td>
		 							</tr>
		 							<tr>
		 								<td>标签:</td>
		 									
		 								<td>
		 								<c:forEach items="${obj.tags }" var = "t">
		 										<input type="checkbox" name="tags" value="${t.id }"/> ${t.name } 
		 									</c:forEach>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td>分类:</td>
		 								<td>
		 								<c:forEach items="${obj.categorys }" var = "c">
		 										<input type="checkbox" name="cats" value="${c.id }"/> ${c.name } 
		 									</c:forEach>
		 							</tr>
		 							<tr>
		 								<td> 内容:</td>
		 								<td><textarea name="content" rows="10" cols="30"></textarea>  </td>
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