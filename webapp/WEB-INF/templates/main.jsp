<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
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
        <a class="brand" href="${base }/">TT-CMS</a>
        <div class="nav-collapse">
          <ul class="nav">
            <li class="active"><a href="${base }/">主页</a></li>
          </ul>
          <form class="navbar-search pull-right" action="${base }/news/search" method="post">
            <input type="text" name="p" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
            <li><a href="${base }/admin/news/list">入口</a></li>
            <li class="divider-vertical"></li>
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
	      <div class="row-fluid">
	      	<div class="span12">
	      		<ul class="nav">
		            <li><a href="${base }/admin/news/list">入口</a></li>
		        </ul>
	      	</div>
	      </div>
	      <div class="row-fluid">
	      	<div class="span12">
	      		<p class="title">日期统计</p>
	      		<c:if test="${p_date != null && p_date.size() >0 }">
		      		<ul class="unstyled">
		      			<c:forEach items="${p_date }" var="pd">
		      				<li><a href="${base }/news/listByMonth?month=${pd.getString("month")}">${pd.getString("month")}</a>(${pd.getString("count") })</li>
		      			</c:forEach>
		      		</ul>
	      		</c:if>
	      	</div>
	      </div>
	      <div class="row-fluid">
	      	<div class="span12">
	      		<p class="title">标签云</p>
	      		<c:if test="${p_tags != null && p_tags.size() >0 }">
		      			<c:forEach items="${p_tags }" var="pt">
		      				<a href="${base }/news/listByTag?id=${pt.getInt("id")}">${pt.getString("name")}(${pt.getString("count") })</a></li>
		      			</c:forEach>
		      			<p>
	      		</c:if>
	      	</div>
	      </div>
	      <div class="row-fluid">
	      	<div class="span12">
	      		<p class="title">文章分类</p>
	      		<c:if test="${p_cats != null && p_cats.size() >0 }">
		      		<ul class="unstyled">
		      			<c:forEach items="${p_cats }" var="pc">
		      				<li><a href="${base }/news/listByCategory?id=${pc.getString("id")}">${pc.getString("name")}</a>(${pc.getString("count") })</li>
		      			</c:forEach>
		      		</ul>
	      		</c:if>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>