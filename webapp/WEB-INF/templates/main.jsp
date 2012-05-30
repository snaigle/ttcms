<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="index, follow">
<link rel="shortcut icon" type="image/x-icon" href="${base }/favicon.ico">
<LINK REL="StyleSheet" HREF="${base }/css/bootstrap.css" TYPE="text/css" MEDIA=screen>
<title>天天随笔  <sitemesh:write property="title"/></title>
<meta name="Keywords" content="天天,TT-CMS,TT64,tiantian,nutz4ror,nor,天天博客,feiyan35488">
<meta name="Description" content="天天的个人博客(feiyan35488.com),这里有我生活的感悟,也有我平时所用技术的分享,希望大家能有所收获">
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
            <c:if test="${p_menu !=null && p_menu.size>0 }">
            	<c:forEach items="${p_menu }" var="m">
            		<li><a href="${m.url.startsWith('http')?m.url:base+m.url }">${m.name }</a>
            	</c:forEach>
            </c:if>
          </ul>
          <form class="navbar-search pull-right" action="${base }/search" method="post">
            <input type="text" name="p" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
            <li><a href="${base }/admin/news/list">管理</a></li>
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
	      		<p class="title"><h3>文章归档</h3></p>
	      		<c:if test="${p_date != null && p_date.size() >0 }">
		      		<ul class="unstyled">
		      			<c:forEach items="${p_date }" var="pd">
		      				<li><a href="${base }/month/${pd.getString("month")}">${pd.getString("month")}</a>(${pd.getString("count") })</li>
		      			</c:forEach>
		      		</ul>
	      		</c:if>
	      	</div>
	      </div>
	      <div class="row-fluid">
	      	<div class="span12">
	      		<p class="title"><h3>标签云</h3></p>
	      		<c:if test="${p_tags != null && p_tags.size() >0 }">
		      			<c:forEach items="${p_tags }" var="pt" varStatus="vs">
		      				<a href="${base }/tag/${pt.getInt("id")}" style="font-size:1${vs.index%3==0?0:(vs.index%3==1?5:9)}0%;color:${vs.index%3 ==0?'black':(vs.index%3==1?'green':'blue') }">${pt.getString("name")}(${pt.getString("count") })</a>
		      				<c:if test="${! st.last }">
								&nbsp;&nbsp;&nbsp;&nbsp;		      					
		      				</c:if>
		      				</li>
		      			</c:forEach>
		      			<p>
	      		</c:if>
	      	</div>
	      </div>
	      <div class="row-fluid">
	      	<div class="span12">
	      		<p class="title"><h3>分类</h3></p>
	      		<c:if test="${p_cats != null && p_cats.size() >0 }">
		      		<ul class="unstyled">
		      			<c:forEach items="${p_cats }" var="pc">
		      				<li><a href="${base }/cat/${pc.getString("id")}">${pc.getString("name")}</a>(${pc.getString("count") })</li>
		      			</c:forEach>
		      		</ul>
	      		</c:if>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<footer style="text-align:center;">
		Powered by <a href="mailto:feiyan35488@gmail.com" target="blank">天天</a><br/>
		COPYRIGHT 2012.4- BY TIANTIAN
	</footer>
	<!-- JiaThis Button BEGIN -->
	<script type="text/javascript">var jiathis_config = {data_track_clickback:true};</script>
	<script type="text/javascript" src="http://v2.jiathis.com/code_mini/jiathis_r.js?move=0&amp;uid=1506207" charset="utf-8"></script>
<!-- JiaThis Button END -->
<!-- UJian Button BEGIN -->
	<script type="text/javascript" src="http://v1.ujian.cc/code/ujian.js?type=slide&uid=1506207"></script>
<!-- UJian Button END -->
	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-20701558-4']);
	  _gaq.push(['_setDomainName', 'feiyan35488.com']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
</body>
</html>