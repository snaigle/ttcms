package controllers;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.lang.util.Context;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
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
	public Object list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,null,new String[]{"id","desc"}, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
		return ctx;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public Object listByTag(@Param("offset")int offset , @Param("max")int max,@Param("id")int id) {
		if(id == 0){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,"id in (select news_id from t_news_tag where tag_id = "+id+")","order by id desc", offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("tagId", id);
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
		return ctx;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public Object  listByMonth(@Param("offset")int offset , @Param("max")int max,@Param("month")String month) {
		if(Strings.isEmpty(month)){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.where("concat(year(create_time),'-',month(create_time))","=", month),new String[]{"id","desc"}, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("month", month);
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
		return ctx;
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public Object  listByCategory(@Param("offset")int offset , @Param("max")int max,@Param("id")int id) {
		if(id == 0){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,"id in (select news_id from t_news_category where category_id = "+id+")","order by id desc", offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("catId", id);
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
		return ctx;
	}
	/**
	 * params: offset,max,keyword
	 * @return
	 */
	public Object search(@Param("offset")int offset , @Param("max")int max,@Param("p")String p) {
		if(Strings.isEmpty(p)){
			return new ServerRedirectView("/news/list");
		}
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.where("title","like","%"+p+"%").or("content", "like", "%"+p+"%"),new String[]{"id","desc"}, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		Context ctx = Lang.context();
		ctx.set("obj", pf);
		ctx.set("p", p);
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
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

	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
