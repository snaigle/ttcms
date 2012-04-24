package controllers;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.lang.util.Context;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.view.ServerRedirectView;

import utils.PluginUtil;
import utils.form.PageForm;
import domains.Category;
import domains.News;
import domains.Tag;

public class NewsController {

	@Ok(">>:/news/list")
	public void index(){
	}
	/**
	 * params: offset,max
	 * @return
	 */
	public Object list(int offset , int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"),null, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		PluginUtil.getAllCount(dao,ctx);
		return ctx;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public Object listByTag(int offset , int max,int id) {
		if(id == 0){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.format("id in (select news_id from t_news_tag where tag_id = %d) order by id desc",id ),Cnd.format("id in (select news_id from t_news_tag where tag_id = %d)",id ), offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("tagId", id);
		PluginUtil.getAllCount(dao,ctx);
		return ctx;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public Object  listByMonth(int offset ,int max,String month) {
		if(Strings.isEmpty(month)){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.where("concat(year(create_time),'-',month(create_time))","=", month).desc("id"),Cnd.where("concat(year(create_time),'-',month(create_time))","=", month), offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("month", month);
		PluginUtil.getAllCount(dao,ctx);
		return ctx;
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public Object  listByCategory(int offset , int max,int id) {
		if(id == 0){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.format("id in (select news_id from t_news_tag where tag_id = %d) order by id desc",id ),Cnd.format("id in (select news_id from t_news_tag where tag_id = %d)",id ), offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("catId", id);
		PluginUtil.getAllCount(dao,ctx);
		return ctx;
	}
	/**
	 * params: offset,max,keyword
	 * @return
	 */
	public Object search(int offset , int max,String p) {
		if(Strings.isEmpty(p)){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.where("title","like","%"+p+"%").or("content", "like", "%"+p+"%").desc("id"),Cnd.where("title","like","%"+p+"%").or("content", "like", "%"+p+"%"), offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("p", p);
		PluginUtil.getAllCount(dao,ctx);
		return ctx;
	}
	public News create() {
		News news = new News();
		List<Tag> tags = dao.query(Tag.class, null, null);
		List<Category> cats = dao.query(Category.class,null,null);
		news.setTags(tags);
		news.setCategorys(cats);
		return news;
	}

	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
