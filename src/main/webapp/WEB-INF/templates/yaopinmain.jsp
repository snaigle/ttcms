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
        <a class="brand" href="${base }/orders/list">后台管理</a>
        <div class="nav-collapse">
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div>
	<div class="container-fluid" style="width:90%;">
	  <div class="row-fluid">
	    <div class="span2">
	      <ul>
	      	<li><a href="${base }/orders/list">订单管理</a>
		      	<ul>
		      		<li><a href="${base }/orders/list">未处理的订单</a></li>
		      		<li><a href="${base }/orders/list?state=已发货">已发货的订单</a></li>
		      		<li><a href="${base }/orders/list?state=完成">已完成订单</a></li>
		      		<li><a href="${base }/orders/create">新建订单</a></li>
		      	</ul>
	      	</li>
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