<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
	<head>
		<title>所有文章</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/editor/plugins/code/prettify.css" type="text/css"/>
	</head>
<body>
	<c:if test="${obj.results.size() >0 }">
		<c:forEach items="${obj.results }"  var="it">
		 	<div class="row-fluid">
		 			<div class="span12" >
		 					<h2>${it.title }</h2>
		 					<p>
		 						<small>发布于 <fmt:formatDate value="${it.createTime }" pattern="yyyy年MM月dd日  HH:mm" /></small>
		 					</p>
		 					<p style="padding:5px 10px;">${it.content.replaceAll("\\n","<p style=\"padding:0 10px\">") }</p>
		 					<p>
		 						<small>发布在
		 						<c:forEach items="${it.categorys}" var="c">
		 								${c.name }&nbsp;&nbsp;
		 						</c:forEach>
		 						<c:if test="${it.tags.size()>0 }">
		 							(<c:forEach items="${it.tags }" var="t">
			 								 ${t.name } 
			 						</c:forEach>)
		 						</c:if>
		 						</small>
		 						<c:if test="${it.comments.size()==0 }">
		 							<small>还没有奏折,快去占个沙发</small>
		 						</c:if>
		 						<c:if test="${it.comments.size()!=0 }">
		 							<small>有${it.comments.size() }个奏折,去批阅一下</small>
		 						</c:if>
		 						<small><a href="${base }/show/${it.id}">戳这里</a></small>
		 					</p>
		 			</div>
		 	</div>
		</c:forEach>
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