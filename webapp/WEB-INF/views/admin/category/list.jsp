<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>类别列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row">
		 			<div class="span12">
		 				<c:if test="${obj.results.size() != 0 }">
		 				<form action="${base }/admin/category/deleteAll" method="post">
		 					<table width="100%">
		 						<thead>
		 							<tr>
		 								<td><input type="checkbox" >全选</td>
		 								<td>名称</td>
		 								<td>操作</td>
		 							</tr>
		 						</thead>
		 						<tbody>
		 							<c:forEach items="${obj.results }" var="cat">
		 							<tr>
		 								<td><input type="checkbox" name="ids" value="${cat.id }"></td>
		 								<td>${cat.name }</td>
		 								<td>
		 									<a href="${base }/admin/category/edit?id=${cat.id}">编辑</a>
		 									<a href="${base }/admin/category/delete?id=${cat.id}">删除</a>
										</td>
		 							</tr>
		 							</c:forEach>
		 						</tbody>
		 					</table>
	 					</form>
	 					<div class="row">
							<div class="span12 pager">
								<c:if test="${ ! obj.pager.first}">
									<a href="${base }/news/list?offset=${obj.pager.pageNumber -1}" class="before">上一页</a>
								</c:if>
								<span >第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount }</span>
								<c:if test="${ ! obj.pager.last}">
									<a href="${base }/news/list?offset=${obj.pager.pageNumber +1}" class="after">下一页</a>
								</c:if>
							</div>
						</div>
	 					</c:if>
	 					<c:if test="${obj.results.size() == 0 }">
	 						没有类别，去<a href="${base }/admin/category/create">添加</a>
	 					</c:if>
		 			</div>
		 	</div>
</body>
</html>