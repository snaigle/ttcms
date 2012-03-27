<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>新闻列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
	</head>
<body>
	<c:if test="${obj.results.size() >0 }">
		<c:forEach items="${obj.results }"  var="it">
		 	<div class="row">
		 			<div class="span12">
		 					${it.title }
		 			</div>
		 	</div>
		 	<div class="row-fluid">
		 			<div class="span12">
		 					${it.content }
		 			</div>
		 	</div>
		</c:forEach>
	</c:if>
	<c:if test="${obj.results.size() ==0 }">
		<div class="row">
			<div class="span12">
				没有新闻
			</div>
		</div>
	</c:if>
</body>
</html>