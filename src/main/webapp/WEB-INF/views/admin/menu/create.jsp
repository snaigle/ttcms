<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
<head>
<title>新建${msg["Menu.listName"]}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="adminmain">
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<c:if test="${message != null }">
 				<div class="badge badge-info">
					${message}			 					
 				</div>
			</c:if>
			<form action="${base }/admin/menu/save" method="post">
				<table style="width:100%">
					<tbody>
						<tr>
							<td >${msg["Menu.name"]}:</td>
							<td >		<input name="name" value=""/>
							</td>
						</tr>
						<tr>
							<td >${msg["Menu.url"]}:</td>
							<td >		<input name="url" value=""/>
							</td>
						</tr>
						</tr>
						<tr>
							<td >${msg["Menu.mtype"]}:</td>
							<td >
								<select name="mtype">
									<option value="menu">菜单</option>
									<option value="linked">友情链接</option>
								</select>
							</td>
						</tr>
						</tr>
						<tr>
							<td >${msg["Menu.morder"]}:</td>
							<td >		<input name="morder" value=""/>
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
</body>
</html>