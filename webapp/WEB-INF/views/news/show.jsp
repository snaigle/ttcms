<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
	<head>
		<title>文章列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/editor/plugins/code/prettify.css" type="text/css"/>
	</head>
<body>
		 	<div class="row-fluid">
		 			<div class="span12" style="margin:20px;">
		 					<h2>${obj.title }</h2>
		 					<p>
		 						<small>发布于 <fmt:formatDate value="${obj.createTime }" pattern="yyyy年MM月dd日  HH:mm" /></small>
		 					</p>
		 					<p style="padding:5px 10px;">${obj.content.replaceAll("\\n","<p style=\"padding:0 10px\">") }</p>
		 					<p>
		 						<small>发布在
		 						<c:forEach items="${obj.categorys}" var="c">
		 								${c.name }&nbsp;&nbsp;
		 						</c:forEach>
		 						<c:if test="${it.tags.size()>0 }">
		 							(<c:forEach items="${obj.tags }" var="t">
			 								 ${t.name } 
			 						</c:forEach>)
		 						</c:if>
		 						</small>
		 					</p>
		 			</div>
		 	</div>
		 	
		 	<div class="row-fluid"  id="comment">
		 		<c:if test="${obj.comments.size() >0 }">
 					<h2>所有评论</h2>
 					<c:forEach items="${obj.comments }" var="it">
		 			<div class="span12" style="margin:5px;">
		 				<p>${it.content}</p>
		 				<p><small>${it.username}发布于<fmt:formatDate value="${it.createDate }" pattern="yyyy年MM月dd日  HH:mm:ss"/></small></p>
		 			</div>
		 			</c:forEach>
		 		</c:if>
		 		<c:if test="${ obj.comments.size() == 0 }">
		 			<div class="badge">没有评论</div>
		 		</c:if>
		 	</div>
		 	<div class="row-fluid">
		 		<div class="span12" style="margin:5px;">
		 			
		 				<form>
			 			<table width="100%">
			 				<tr>
			 					<td>用户名*</td>
			 					<td style="width:90%"><input name="username"/></td>
			 				</tr>
			 				<tr>
			 					<td>暗号*</td>
			 					<td><input name="code"/>(提示:天王盖地虎)</td>
			 				</tr>
			 				<tr>
			 					<td>评论*</td>
			 					<td><textarea name="content" style="width:60%" rows="10"></textarea>
	 								<p>
										您当前输入了 <span class="word_count">0</span> 个文字。
									</p>
			 					</td>
			 				</tr>
			 				<tr>
			 					<td colspan="2" ><input type="button" class="btn" value="提交评论" /></td>
			 				</tr>
			 			</table>
			 			</form>
		 		</div>
		 	</div>
	<script type="text/javascript" src="<%=request.getContextPath() %>/editor/plugins/code/prettify.js"></script>
	<script type="text/javascript">
		prettyPrint();
	</script>
	<script charset="utf-8" src="${base}/js/jquery-1.7.2.min.js"></script>
	<script charset="utf-8" src="${base}/editor/kindeditor-min.js"></script>
			<script charset="utf-8" src="${base}/editor/lang/zh_CN.js"></script>
			<script>
			var editor = null;
				$(function() {
					editor = KindEditor.create('textarea[name="content"]', {
						allowImageUpload:false,
						allowFlashUpload:false,
						allowMediaUpload:false,
						allowFileUpload:false,
						afterChange : function() {
							$('.word_count').html(this.count('text'));
						}
					});
					$(":button").click(function(){
						editor.sync();
						if($(":input[name='username']").val() == "" || $(":input[name='code']").val() == "" || editor.html() == ""){
							alert("都不能为空");
							return false;
						}
						$(":button").attr("disable","");
						$.post("/news/saveComment?"+$("form").serialize(),{},function(obj){
							if(!obj.result){
								alert(obj.msg);
								return ;
							}
							var comment = $("#comment");
							if($(".badge").length == 0){
								comment.append("<div class=\"span12\" style=\"margin:5px;\"><p>"+editor.html()+"</p><p><small>"+$(":input[name='username']").val()+"发布于"+(new Date().toString())+"</small></p></div>");
							}else{
								comment.empty();
								comment.append("<h2>所有评论</h2>");
								comment.append("<div class=\"span12\" style=\"margin:5px;\"><p>"+editor.html()+"</p><p><small>"+$(":input[name='username']").val()+"发布于"+(new Date().toString())+"</small></p></div>");
							}
							$(":input[name='username']").val("");
							$(":input[name='code']").val("");
							editor.html("");
							$(":button").removeAttr("disable");
						},"json");
					});
				});
				
			</script>
</body>
</html>