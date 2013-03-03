<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<html>
<head>
<title>${obj.title}</title>
<meta name="layout" content="main" />
</head>
<body>
	<article class="unit-article layout-post">
		<div class="unit-inner unit-article-inner">
			<div class="content">
				<header>
					<div class="unit-head">
						<div class="unit-inner unit-head-inner">
							<h1 class="h2 entry-title">${obj.title}</h1>
						</div>
						<!-- unit-inner -->
					</div>
					<!-- unit-head -->
				</header>

				<div class="bd">
					<div class="entry-content">
						${obj.content}
						<div class="meta">
							<p class="date-publish">
								发布于:
								<date class="date-pub" title="{{ page.date | date_to_string }}"
									datetime="{{ page.date | date_to_string }}" pubdate> <span
									class="year"><fmt:formatDate value="${obj.createTime }"
										pattern="yyyy年" /></span> <span class="month"><abbr><fmt:formatDate
											value="${obj.createTime }" pattern="MM月" /></abbr></span> <span
									class="day"><fmt:formatDate value="${obj.createTime }"
										pattern="dd日" /></span> </date>
							</p>
							<ul class="list-category list-linear">
								<li class="list-head">分类:</li>
								<c:forEach items="${obj.categorys}" var="c">
		 								${c.name }&nbsp;&nbsp;
		 						</c:forEach>
							</ul>
							<ul class="list-tag list-linear">
								<li class="list-head">标签:</li>
								<c:forEach items="${obj.tags }" var="t">
			 								 ${t.name } &nbsp;&nbsp;
			 						</c:forEach>
							</ul>
						</div>
						<!-- meta -->
					</div>
					<!-- entry-content -->
					<div class="misc-content">
						<div class="social">
							<ul class="list-linear">
								<li><div class="twitter-tweet">
										<a href="https://twitter.com/share"
											class="twitter-share-button" data-count="horizontal"
											data-via="feiyan35488" data-lang="en">推来推去</a>
									</div></li>
								<li><div class="twitter-follow">
										<a href="https://twitter.com/feiyan35488"
											class="twitter-follow-button" data-show-count="false"
											data-lang="en"></a>
									</div></li>
							</ul>
						</div>
						<div class="comment"></div>
					</div>
					<!-- misc-content -->
				</div>
				<!-- bd -->
				<footer class="unit-foot">
					<div class="unit-inner unit-foot-inner">
						<nav class="pagination">
							<ul>
								<c:if test="${prev != null }">
									<li class="prev"><a class="internal" rel="prev"
										href="${base }/show/${prev.id }" title="View ${prev.title }">&laquo;
											${prev.title }</a></li>
								</c:if>
								<c:if test="${prev != null && next!= null }">
									<li class="pipe">|</li>
								</c:if>
								<c:if test="${next !=null}">
									<li class="next"><a class="internal" rel="next"
										href="${base }/show/${ next.id }" title="View ${next.title }">
											${next.title } &raquo;</a></li>
								</c:if>
							</ul>
						</nav>
						<p class="gotop" style="float: right; padding-right: 20px;">
							<a href="#page">回到顶部</a>
						</p>
					</div>
				</footer>

			</div>
			<!-- content -->
		</div>
		<!-- unit-inner -->
	</article>
	<div id="disqus_thread"></div>
	<script type="text/javascript">
		/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		var disqus_shortname = 'strongsnail'; // required: replace example with your forum shortname

		/* * * DON'T EDIT BELOW THIS LINE * * */
		(function() {
			var dsq = document.createElement('script');
			dsq.type = 'text/javascript';
			dsq.async = true;
			dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document
					.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	</script>
	<noscript>
		Please enable JavaScript to view the <a
			href="http://disqus.com/?ref_noscript">comments powered by
			Disqus.</a>
	</noscript>
	<a href="http://disqus.com" class="dsq-brlink">comments powered by
		<span class="logo-disqus">Disqus</span>
	</a>
</body>
</html>
