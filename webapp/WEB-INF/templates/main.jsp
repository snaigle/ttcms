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
            <li class="active"><a href="#">主页</a></li>
            <li><a href="#">创意</a></li>
            <li><a href="#">目标</a></li>
            <li><a href="#">心情</a></li>
            <li><a href="#">留言板-未开放</a></li>
            <li><a href="#">联系我们</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉菜单 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">动作1</a></li>
                <li><a href="#">动作2</a></li>
                <li><a href="#">动作3</a></li>
                <li class="divider"></li>
                <li class="nav-header">导航标题</li>
                <li><a href="#">分隔链接</a></li>
                <li><a href="#">链接</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-search pull-right" action="<%=request.getContextPath()%>/news/search">
            <input type="text" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
            <li><a href="#">Link</a></li>
            <li class="divider-vertical"></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉菜单 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div>
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="span10">
	      <!--Body content-->
			<sitemesh:write property="body"/>
	    </div>
	    <div class="span2">
	      <!--Sidebar content-->
	    </div>
	  </div>
	</div>
</body>
</html>