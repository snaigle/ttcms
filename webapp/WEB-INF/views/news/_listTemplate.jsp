<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
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