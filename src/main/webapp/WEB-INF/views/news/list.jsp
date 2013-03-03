<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<html>
<head>
<meta name="layout" content="main" />
</head>
<body>
	<div class="row">
		<div class="span12 pager">
			<c:if test="${! obj.pager.first }">
				<c:if test="${obj.pager.pageNumber == 2 }">
					<a href="${base }/" class="before">上一页</a>
				</c:if>
				<c:if test="${obj.pager.pageNumber > 2 }">

					<a href="${base }/page/${obj.pager.pageNumber -1}" class="before">上一页</a>
				</c:if>
			</c:if>
			<span>第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount}</span>
			<c:if test="${! obj.pager.last}">
				<a href="${base }/page/${obj.pager.pageNumber +1}" class="after">下一页</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="_listTemplate.jsp" />
	<div class="row">
		<div class="span12 pager">
			<c:if test="${! obj.pager.first}">
				<c:if test="${obj.pager.pageNumber ==2}">
					<a href="${base }/" class="before">上一页</a>
				</c:if>
				<c:if test="${obj.pager.pageNumber >2}">
					<a href="${base }/page/${obj.pager.pageNumber -1}" class="before">上一页</a>
				</c:if>
			</c:if>
			<span>第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount}</span>
			<c:if test="${!obj.pager.last}">
				<a href="${base }/page/${obj.pager.pageNumber +1}" class="after">下一页</a>
			</c:if>
		</div>
	</div>
</body>
</html>