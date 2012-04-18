<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>数据库初始化</title>
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
			</div>
 	</div>
</body>
</html>