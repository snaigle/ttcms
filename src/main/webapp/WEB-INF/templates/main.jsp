<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 ie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8 ie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9 ie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="天天,TT-CMS,TT64,tiantian,天天博客,feiyan35488">
<meta name="Description"
	content="天天的个人博客(feiyan35488.com),这里有我生活的感悟,也有我平时所用技术的分享,希望大家能有所收获">
<title><sitemesh:write property="title" /></title>
<link rel="stylesheet" href="${base }/css/prettify.css" type="text/css" />
<link href='${base }/css/style.css?v=20130115' rel="stylesheet"
	media="all">
<sitemesh:write property="head" />
</head>
<body>
	<div id="page" class="hentry">
		<header class="the-header">
			<div class="unit-head">
				<div class="unit-inner unit-head-inner">
					<nav class="nav-global">
						<ul>
							<li class="logo"><a href="${base }/">坚强的蜗牛</a></li>
							<c:if test="${p_menu !=null}">
								<c:forEach items="${p_menu }" var="m">
									<li class="category"><a href="${base}${m.url}">${m.name}</a></li>
								</c:forEach>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- unit-inner -->
			</div>
			<!-- unit-head -->
		</header>
		<div class="body" role="main">
			<div class="unit-body">
				<div class="unit-inner unit-body-inner">
					<div class="entry-content">
						<sitemesh:write property="body" />
					</div>
				</div>
				<!-- unit-inner -->
			</div>
			<!-- unit-body -->
		</div>
		<!-- body -->
		<footer class="the-footer">
			<div class="unit-foot">
				<div class="unit-inner unit-foot-inner">
					<div class="misc vcard">
						<h4>关于</h4>
						<ul>
							<li class="contact"><address>
									<span class="author fn n">天天</span> - <span class="fn email">feiyan35488[@]gmail.com</span>
								</address></li>
							<li class="rss"><a href="#">订阅</a></li>
						</ul>
					</div>
					<!-- misc -->
					<p class="licence">
						Theme: based on <a href="http://jekyllbootstrap.com/">Jekyll-bootstrap</a>.<br>
						Powered by <a href="https://github.com/mojombo/jekyll">Jekyll</a>.



					
					<p>
						页面生成于
						<%=new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss:SSS")
					.format(new java.util.Date())%></p>
					</p>
				</div>
				<!-- unit-foot-inner -->
			</div>
			<!-- unit-foot -->
		</footer>
	</div>
	<!-- page -->
	<script type="text/javascript" src="${base }/js/prettify.js"></script>
	<script type="text/javascript">
		prettyPrint();
	</script>
	<script type="text/javascript">
		/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		var disqus_shortname = 'strongsnail'; // required: replace example with your forum shortname

		/* * * DON'T EDIT BELOW THIS LINE * * */
		(function() {
			var s = document.createElement('script');
			s.async = true;
			s.type = 'text/javascript';
			s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
			(document.getElementsByTagName('HEAD')[0] || document
					.getElementsByTagName('BODY')[0]).appendChild(s);
		}());
	</script>
</body>
</html>