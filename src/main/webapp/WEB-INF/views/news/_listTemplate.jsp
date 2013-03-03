<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<c:forEach items="${obj.results }" var="it">
	<article class="unit-article layout-post"
		style="margin: 10px 0px; border-radius: 15px; padding: 10px 5px; box-shadow: 5px 5px 20px gray;">
		<div class="unit-inner unit-article-inner">
			<div class="content">
				<header>
					<div class="unit-head">
						<div class="unit-inner unit-head-inner">
							<a href="${base}/show/${it.id}" target="_blank"><h1
									class="h2 entry-title">${it.title }</h1></a>
						</div>
						<!-- unit-inner -->
					</div>
					<!-- unit-head -->
				</header>

				<div class="bd">
					<div class="entry-content">
						${it.content}
						<div class="meta">
							<p class="date-publish">
								发布于:
								<date class="date-pub"
									title="<fmt:formatDate value='${it.createTime }' pattern='yyyy年MM月dd日  HH:mm' />"
									datetime="<fmt:formatDate value='${it.createTime }' pattern='yyyy年MM月dd日  HH:mm' />"
									pubdate> <span class="year"><fmt:formatDate
										value='${it.createTime }' pattern='yyyy年' /></span> <span
									class="month"><abbr><fmt:formatDate
											value='${it.createTime }' pattern='MM月' /></abbr></span> <span class="day"><fmt:formatDate
										value='${it.createTime }' pattern='dd日' /></span> </date>
							</p>
						</div>
						<!-- meta -->
					</div>
					<!-- entry-content -->
				</div>
				<!-- bd -->
				<footer class="unit-foot">
					<div class="unit-inner unit-foot-inner">
						<a href="${base}/show/${it.id }#disqus_thread">评论</a> 标签:
						<c:forEach items="${it.tags }" var="t">
			 								 ${t.name }&nbsp;&nbsp;
			 						</c:forEach>
						分类:
						<c:forEach items="${it.categorys}" var="c">
		 								${c.name }&nbsp;&nbsp;
		 						</c:forEach>
					</div>
				</footer>
			</div>
			<!-- content -->
		</div>
		<!-- unit-inner -->
	</article>
</c:forEach>
