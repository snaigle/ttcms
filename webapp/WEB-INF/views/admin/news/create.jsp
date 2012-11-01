<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>增加文章</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" type="text/css" href="${base }/css/markdown.css"></link>
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
		 								<td style="width:90%"><input name="title" style="width:70%" placeholder="标题"/></td>
		 							</tr>
		 							<tr>
		 								<td>标签:
		 								<c:forEach items="${obj.tags }" var = "t">
		 										<input type="checkbox" name="tags" value="${t.id }"/> ${t.name } 
		 									</c:forEach>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td>分类
		 								<c:forEach items="${obj.categorys }" var = "c">
		 										<input type="checkbox" name="cats" value="${c.id }"/> ${c.name } 
		 									</c:forEach>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td style="margin-top:10px;padding-top:20px;">
		 									<c:if test="${'markdown'==type }">
			 									<div style="border-bottom:solid 1px #ccc;width:80%;"><a id='wmd-btn-edit' href="javascript:changemode('edit');" class="btn disabled">编辑模式</a>&nbsp;&nbsp;&nbsp;&nbsp;
			 									<a id="wmd-btn-preview" href="javascript:changemode('preview');" class="btn">预览模式</a>
			 									<a href="${base }/admin/news/changemode" class="btn" style="float:right;">切换编辑器</a>
			 									</div>
			 									<div id="wmd-button-bar" style="border:none;width:70%;"></div>
			 									<textarea placeholder="留下点东西吧" id="wmd-input" name="content" style="width:70%;border:solid 1px black;" rows="30"></textarea>  
												<div id="wmd-preview" style="display:none;width:70%;height:550px;border:dashed 1px #ccc;margin-top:10px;padding:5px;"></div>
											</c:if>
											<c:if test="${'kindeditor'==type }">
												<div style="border-bottom:solid 1px #ccc;width:80%;"><a href="${base }/admin/news/changemode" class="btn" style="float:right;">切换编辑器</a></div>
												<textarea placeholder="留下点东西吧" name="content" style="width:70%;border:solid 1px black;" rows="30"></textarea>  
			 									<p>
													您当前输入了 <span class="word_count">0</span> 个文字。
												</p>
											</c:if>
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
			<c:if test="${'kindeditor'==type }">
			 	<script charset="utf-8" src="${base}/editor/kindeditor-min.js"></script>
				<script charset="utf-8" src="${base}/editor/lang/zh_CN.js"></script>
				<script type="text/javascript">
					KindEditor.ready(function(K) {
						K.create('textarea[name="content"]', {
							allowImageUpload:false,
							allowFlashUpload:false,
							allowMediaUpload:false,
							allowFileUpload:false,
							filterMode:true,
							items:['source','|','undo','redo','|','template','plainpaste','wordpaste','quickformat',
							       '|','formatblock','fontname','fontsize','forecolor','hilitecolor','bold','italic',
							       'underline','strikethrough','link','unlink','insertorderedlist','insertunorderedlist',
							       '|','image','flash','media','table',
							       'emoticons','map','code','|','fullscreen'],
							afterChange : function() {
								K('.word_count').html(this.count('text'));
							}
						});
					});
				</script>
			</c:if>
			<c:if test="${'markdown'==type }">
				<script charset="utf-8" src="${base}/js/Markdown.Converter.js"></script>
				<script charset="utf-8" src="${base}/js/Markdown.Editor.js"></script>
				<script charset="utf-8" src="${base}/js/Markdown.Sanitizer.js"></script>
				<script type="text/javascript">
				var converter = Markdown.getSanitizingConverter();
                var editor = new Markdown.Editor(converter);
                editor.run();
                </script>
                <script type="text/javascript">
					function $id(id){return document.getElementById(id);}
					function changemode(mode){
						if(mode == 'edit'){
							$id("wmd-btn-edit").className='btn disabled';
							$id("wmd-btn-preview").className='btn active';
							$id("wmd-button-bar").style.display='';
							$id("wmd-input").style.display='';
							$id("wmd-preview").style.display='none';
						}else if(mode == 'preview'){
							$id("wmd-btn-edit").className='btn active';
							$id("wmd-btn-preview").className='btn disabled';
							$id("wmd-button-bar").style.display='none';
							$id("wmd-input").style.display='none';
							$id("wmd-preview").style.display='';
						}
					}
				</script>
			</c:if>
</body>
</html>