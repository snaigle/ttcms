<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>文章列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
	</head>
<body>
	<c:if test="${obj.results.size() >0 }">
		<c:forEach items="${obj.results }"  var="it">
		 	<div class="row">
		 			<div class="span12">
		 					<h2>${it.title }</h2>
		 					<p>
		 						<c:forEach items="${it.tags }" var="t">
		 								${t.name },
		 						</c:forEach>
		 					</p>
		 					<p>
		 						<c:forEach items="${it.categorys}" var="c">
		 								${c.name },
		 						</c:forEach>
		 					</p>
		 					<p>${it.content }</p>
		 			</div>
		 	</div>
		</c:forEach>
	</c:if>
	<c:if test="${obj.results.size() ==0 }">
		<div class="row">
			<div class="span12">
				没有文章，去<a href="${base }/admin/news/create">添加</a>
			</div>
		</div>
	</c:if>
</body>
</html>