<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<title>${msg["Menu.listName"]}列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="adminmain">
</head>
<body>
<div class="row">
		 			<div class="span12">
		 				<c:if test="${message != null }">
			 				<div class="badge badge-info">
								${message}			 					
			 				</div>
		 				</c:if>
		 				<c:if test="${obj.results.size() != 0 }">
		 				<form action="${base }/admin/menu/deleteAll" method="post">
		 					<table width="100%">
		 						<thead>
		 							<tr>
		 								<td><input type="checkbox" id="ids" class="selectAll"><input class="btn" type="submit" value="删除"/></td>
		 									<td>${msg["Menu.name"]}</td>
		 									<td>${msg["Menu.url"]}</td>
		 									<td>${msg["Menu.mtype"]}</td>
		 									<td>${msg["Menu.morder"]}</td>
		 								<td>操作</td>
		 							</tr>
		 						</thead>
		 						<tbody>
		 							<c:forEach items="${obj.results }" var="it">
		 							<tr>
		 								<td><input type="checkbox" name="ids" value="${it.id }"></td>
		 									<td><a href="${base}/admin/menu/show?id=${it.id}">${it.name}</a></td>
		 									<td>${it.url}</td>
		 									<td>${it.mtype}</td>
		 									<td>${it.morder}</td>
		 								<td>
		 									<a href="${base }/admin/menu/edit?id=${it.id}">编辑</a>
		 									<a href="${base }/admin/menu/delete?id=${it.id}">删除</a>
										</td >
		 							</tr>
		 							</c:forEach>
		 						</tbody>
		 					</table>
	 					</form>
	 					<div class="row">
							<div class="span12 pager">
								<c:if test="${ ! obj.pager.first}">
									<a href="${base }/admin/menu/list?offset=${obj.pager.pageNumber -1}" class="before">上一页</a>
								</c:if>
								<span >第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount }</span>
								<c:if test="${ ! obj.pager.last}">
									<a href="${base }/admin/menu/list?offset=${obj.pager.pageNumber +1}" class="after">下一页</a>
								</c:if>
							</div>
						</div>
	 					</c:if>
	 					<c:if test="${obj.results.size() == 0 }">
	 						没有${msg["Menu.listName"]}，去<a href="${base }/admin/menu/create">添加</a>
	 					</c:if>
		 			</div>
		 	</div>
</body>
</html>