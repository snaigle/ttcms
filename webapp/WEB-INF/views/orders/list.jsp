<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
<head>
<title>${msg["Orders.listName"]}列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="yaopinmain">
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
			 				<form action="${base }/orders/deleteAll" method="post">
			 					<table width="100%">
			 						<thead>
			 							<tr>
			 								<td><input type="checkbox" id="ids" class="selectAll"><input class="btn" type="submit" value="删除"/></td>
			 									<td>${msg["Orders.name"]}</td>
			 									<td>${msg["Orders.num"]}</td>
			 									<td>${msg["Orders.address"]}</td>
			 									<td>${msg["Orders.mobile"]}</td>
			 									<td>${msg["Orders.fahuo"]}</td>
			 									<td>${msg["Orders.con"]}</td>
			 									<td>${msg["Orders.memo"]}</td>
			 									<td>${msg["Orders.state"]}</td>
			 								<td>操作</td>
			 							</tr>
			 						</thead>
			 						<tbody>
			 							<c:forEach items="${obj.results }" var="it">
			 							<tr>
			 								<td><input type="checkbox" name="ids" value="${it.id }"></td>
			 									<td>${it.name}</td>
			 									<td>${it.num}</td>
			 									<td>${it.address}</td>
			 									<td>${it.mobile}</td>
			 									<td>${it.fahuo}</td>
			 									<td>${it.con}</td>
			 									<td>${it.memo}</td>
			 									<td>${it.state}</td>
			 								<td>
			 									<a href="${base }/orders/edit?id=${it.id}">编辑</a>
			 									<a href="${base }/orders/delete?id=${it.id}">删除</a>
											</td >
			 							</tr>
			 							</c:forEach>
			 						</tbody>
			 					</table>
		 					</form>
		 					<div class="row">
								<div class="span12 pager">
									<c:if test="${ ! obj.pager.first}">
										<a href="${base }/orders/list?state=${state }&offset=${obj.pager.pageNumber -1}" class="before">上一页</a>
									</c:if>
									<span >第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount }</span>
									<c:if test="${ ! obj.pager.last}">
										<a href="${base }/orders/list?state=${state }&offset=${obj.pager.pageNumber +1}" class="after">下一页</a>
									</c:if>
								</div>
							</div>
	 					</c:if>
	 					<c:if test="${obj.results.size() == 0 }">
	 						没有${msg["Orders.listName"]}
	 					</c:if>
		 			</div>
		 	</div>
</body>
</html>