<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>增加文章</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row-fluid">
		 			<div class="span12">
		 				<c:if test="${message != null }">
			 				<div class="badge badge-info">
								${message}			 					
			 				</div>
		 				</c:if>
		 				<form action="${base }/admin/news/save" method="post">
		 					<table style="width:100%">
		 						<tbody>
		 							<tr>
		 								<td >标题:</td>
		 								<td style="width:90%"><input name="title"/></td>
		 							</tr>
		 							<tr>
		 								<td>标签:</td>
		 									
		 								<td>
		 								<c:forEach items="${obj.tags }" var = "t">
		 										<input type="checkbox" name="tags" value="${t.id }"/> ${t.name } 
		 									</c:forEach>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td>分类:</td>
		 								<td>
		 								<c:forEach items="${obj.categorys }" var = "c">
		 										<input type="checkbox" name="cats" value="${c.id }"/> ${c.name } 
		 									</c:forEach>
		 							</tr>
		 							<tr>
		 								<td> 内容:</td>
		 								<td><textarea name="content" style="width:70%" rows="30"></textarea>  
		 									<p>
												您当前输入了 <span class="word_count">0</span> 个文字。
											</p>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td colspan="2" align="center"><input type="submit" class="btn"  value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
		 							</tr>
		 						</tbody>
		 					</table>
		 					 </form>
		 			</div>
		 	</div>
		 	<script charset="utf-8" src="${base}/editor/kindeditor-min.js"></script>
			<script charset="utf-8" src="${base}/editor/lang/zh_CN.js"></script>
			<script>
				KindEditor.ready(function(K) {
					K.create('textarea[name="content"]', {
						allowImageUpload:false,
						allowFlashUpload:false,
						allowMediaUpload:false,
						allowFileUpload:false,
						afterChange : function() {
							K('.word_count').html(this.count('text'));
						}
					});
				});
			</script>
</body>
</html>