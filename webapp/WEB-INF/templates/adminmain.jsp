<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL="StyleSheet" HREF="<%=request.getContextPath() %>/css/bootstrap.css" TYPE="text/css" MEDIA=screen>
<title>后台管理--<sitemesh:write property="title"/></title>
	<sitemesh:write property="head"/>
</head>
<body>
	<div class="navbar">
    <div class="navbar-inner">
      <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a class="brand" href="${base }/admin/news/list">TT-CMS</a>
        <div class="nav-collapse">
          <ul class="nav">
            <li class="active"><a href="${base }/admin/news/list">首页</a></li>
            <li><a href="${base }/">前台首页</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div>
	<div class="container-fluid" style="width:90%;">
	  <div class="row-fluid">
	    <div class="span2">
	      <ul>
	      	<li><a href="${base }/admin/news/list">文章管理</a>
		      	<ul>
		      		<li><a href="${base }/admin/news/create">新建</a></li>
		      	</ul>
	      	</li>
	      	<li><a href="${base }/admin/tag/list">标签管理</a>
		      	<ul>
		      		<li><a href="${base }/admin/tag/create">新建</a></li>
		      	</ul>
		      </li>
	      	<li><a href="${base }/admin/category/list">分类管理</a>
		      	<ul>
		      		<li><a href="${base }/admin/category/create">新建</a></li>
		      	</ul>
		    </li>
	      	<li><a href="${base }/admin/menu/list">菜单</a>
		      	<ul>
		      		<li><a href="${base }/admin/menu/create">新建</a></li>
		      	</ul>
		    </li>
	      	<li><a href="${base }/admin/function/init">初始化sql</a></li>
	      	<li><a href="${base }/admin/function/execsql">exec sql</a></li>
	      	<li><a href="${base }/admin/function/dbupgrade">数据库升级</a></li>
		  </ul>
	    </div>
	    <div class="span10">
	      <!--Body content-->
			<sitemesh:write property="body"/>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="${base }/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${base }/js/util.js"></script>
</body>
</html>