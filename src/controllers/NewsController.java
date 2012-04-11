package controllers;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

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
	public PageForm<News> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,null, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		return pf;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public PageForm<News>  listByTag(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public PageForm<News>  listByCategory(@Param("offset")int offset , @Param("max")int max,@Param("cat")int category) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,keyword
	 * @return
	 */
	public PageForm<News> search(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
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
