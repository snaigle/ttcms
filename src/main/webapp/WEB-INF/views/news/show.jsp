<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
	<head>
		<title>${obj.title}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/editor/plugins/code/prettify.css" type="text/css"/>
	</head>
<body>
		 	<div class="row-fluid">
		 			<div class="span12">
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
		 						<small><a href="${base }/admin/news/edit?id=${obj.id}">陛下的传送门</a></small>
		 					</p>
		 			</div>
		 	</div>
		 	
		 	<div class="row-fluid"  id="comment">
		 		<c:if test="${obj.comments.size() >0 }">
 					<h2>所有奏折</h2>
 					<c:forEach items="${obj.comments }" var="it">
		 			<div class="span12" style="margin:5px;">
		 				<p>${it.content}</p>
		 				<p><small>${it.username}上奏于<fmt:formatDate value="${it.createTime }" pattern="yyyy年MM月dd日  HH:mm:ss"/></small></p>
		 			</div>
		 			</c:forEach>
		 		</c:if>
		 		<c:if test="${ obj.comments.size() == 0 }">
		 			<div class="badge">没有奏折</div>
		 		</c:if>
		 	</div>
		 	<div class="row-fluid">
		 		<div class="span12" style="margin:5px;">
		 			
		 				<form id="aForm">
	 					<input type="hidden" name="newsId" value="${obj.id }"/>
			 			<table width="100%">
			 				<tr>
			 					<td style="width:90%"><input name="username" placeholder="好汉留个大名吧"/></td>
			 				</tr>
			 				<tr>
			 					<td><input name="code" placeholder="没暗号谁都不让进" style="width:110px;"/><img src="${base}/common/verifyCode?v=1" onclick="this.src = this.src+'1';" style="margin-bottom:9px"/></td>
			 				</tr>
			 				<tr>
			 					<td><textarea name="content" style="width:60%" rows="10" placeholder="英雄留下点墨宝吧"></textarea>
	 								<p>
										您当前输入了 <span class="word_count">0</span> 个文字。
									</p>
			 					</td>
			 				</tr>
			 				<tr>
			 					<td colspan="2" ><input type="button" class="btn" value="臣有本奏"/></td>
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
						filterMode:true,
						items:['fontsize','forecolor','hilitecolor','bold','italic',
						       'underline','strikethrough','insertorderedlist','insertunorderedlist',
						       '|','image','flash','media','table',
						       'emoticons','code'],
						afterChange : function() {
							$('.word_count').html(this.count('text'));
						}
					});
					$(":button").click(function(){
						editor.sync();
						if($(":input[name='code']").val() == "" ){
							alert($(":input[name='code']").attr("placeholder"));
							return false;
						}
						if(editor.html() == ""){
							alert($(":input[name='content']").attr("placeholder"));
							return false;
						}
						$(":button").attr("disabled","disabled");
						var obj = {username:$(":input[name='username']").val(),
							code:$(":input[name='code']").val(),
							content:editor.html(),
							newsId:$(":input[name='newsId']").val()
						};
						
						$.post("${base}/news/saveComment",obj,function(db){
							
							db = $.parseJSON(db);
							if(!db.result){
								alert(db.msg);
								$(":button").removeAttr("disabled");
								return ;
							}
							var comment = $("#comment");
							if($(".badge").length == 0){
								comment.append("<div class=\"span12\" style=\"margin:5px;\"><p>"+editor.html()+"</p><p><small>"+($(":input[name='username']").val()==""?"方外野人":$(":input[name='username']").val())+"上奏于"+getCurrentDate()+"</small></p></div>");
							}else{
								comment.empty();
								comment.append("<h2>所有奏折</h2>");
								comment.append("<div class=\"span12\" style=\"margin:5px;\"><p>"+editor.html()+"</p><p><small>"+($(":input[name='username']").val()==""?"方外野人":$(":input[name='username']").val())+"上奏于"+getCurrentDate()+"</small></p></div>");
							}
							$(":input[name='username']").val("");
							$(":input[name='code']").val("");
							editor.html("");
							$(":button").removeAttr("disabled");
						});
					});
				});
				function getCurrentDate(){
					var now = new Date();
					return now.getFullYear()+"年" + (now.getMonth()+1) +"月"+now.getDate()+"日 "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
				}
			</script>
</body>
</html>