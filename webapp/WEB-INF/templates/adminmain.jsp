<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL="StyleSheet" HREF="<%=request.getContextPath() %>/css/bootstrap.css" TYPE="text/css" MEDIA=screen>
<title><sitemesh:write property="title"/></title>
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
        <a class="brand" href="#">TT-CMS</a>
        <div class="nav-collapse">
          <ul class="nav">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="#">前台首页</a></li>
          </ul>
          <form class="navbar-search pull-right" action="<%=request.getContextPath()%>/news/search">
            <input type="text" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
            <li><a href="#">退出</a></li>
            <li class="divider-vertical"></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div>
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="span2">
	      <ol>
	      	<li><a href="${base }/admin/news/list">文章管理</a></li>
	      	<ol>
	      		<li><a href="${base }/admin/news/create">新建</a></li>
	      	</ol>
	      </ol>
	      <ol>
	      	<li><a href="${base }/admin/tag/list">标签管理</a></li>
	      	<ol>
	      		<li><a href="${base }/admin/tag/create">新建</a></li>
	      	</ol>
	      </ol>
	      <ol>
	      	<li><a href="${base }/admin/category/list">分类管理</a></li>
	      	<ol>
	      		<li><a href="${base }/admin/category/create">新建</a></li>
	      	</ol>
	      </ol>
	    </div>
	    <div class="span10">
	      <!--Body content-->
			<sitemesh:write property="body"/>
	    </div>
	  </div>
	</div>
</body>
</html>