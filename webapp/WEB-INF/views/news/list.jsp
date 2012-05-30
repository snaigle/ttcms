<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${base }/editor/plugins/code/prettify.css" type="text/css"/>
	</head>
<body>
	<c:if test="${obj.results.size() >0 }">
		<jsp:include  page="_listTemplate.jsp"/>
		<div class="row">
			<div class="span12 pager">
				<c:if test="${ ! obj.pager.first}">
					<a href="${base }/page/${obj.pager.pageNumber -1}" class="before">上一页</a>
				</c:if>
				<span >第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount }</span>
				<c:if test="${ ! obj.pager.last}">
					<a href="${base }/page/${obj.pager.pageNumber +1}" class="after">下一页</a>
				</c:if>
			</div>
		</div>
	</c:if>
	<c:if test="${obj.results.size() ==0 }">
		<div class="row">
			<div class="span12">
 				<div class="badge">
					没有找到内容,在右下角看看推荐内容吧	 					
 				</div>
			</div>
		</div>
	</c:if>
	<script type="text/javascript" src="<%=request.getContextPath() %>/editor/plugins/code/prettify.js"></script>
	<script type="text/javascript">
		prettyPrint();
	</script>
</body>
</html>