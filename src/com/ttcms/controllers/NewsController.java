package com.ttcms.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.nutz.castor.castor.Datetime2String;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Param;

import com.ttcms.domains.Category;
import com.ttcms.domains.News;
import com.ttcms.domains.Tag;
import com.ttcms.utils.form.PageForm;

public class NewsController {

	@At(">>:/news/list")
	public void index(){
	}
	/**
	 * params: offset,max
	 * @return
	 */
	public PageForm<News> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,null, offset, max);
		return pf;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public PageForm<News>  listByTag(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("createTime"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public PageForm<News>  listByCategory(@Param("offset")int offset , @Param("max")int max,@Param("cat")int category) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("createTime"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,keyword
	 * @return
	 */
	public PageForm<News> search(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("createTime"), offset, max);
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
	public void save(@Param("title")String title,@Param("content")String content,@Param("tags")String tags,@Param("cats")String cats) {
		if(Strings.isEmpty(title)){
			title = new Datetime2String().cast(new Date(),null, "yyyy年MM月dd日")+"  留念";
		}
		if(Strings.isEmpty(content)){
			content = "";
		}
		News news = new News();
		news.setTitle(title);
		news.setContent(content);
		news.setCreateTime(new Date());
		List<Tag> tagLists  = null;
		if(Strings.isEmpty(tags)){
			//getDefaultTag
		}else{
			// getTheExistsTags
			tagLists = dao.query(Tag.class, Cnd.wrap(" "), null);
			// new the last Tags
		}
		news.setTags(tagLists);
		List<Category> catLists = null;
		if(Strings.isEmpty(cats)){
			// get default category
		}else{
			catLists= dao.query(Category.class, Cnd.wrap(""), null);
		}
		news.setCategorys(catLists);
		dao.insertWith(news, null);
	}
	public void edit() {
		
	}
	public void update() {
		
	}
	public void delete() {
		
	}
	public void deleteAll() {
		
	}
	
	public String init(ServletContext ctx){
		 String initSql = ctx.getRealPath("/WEB-INF/classes/dbinit.sql");
		 Sql sql = Sqls.create("runscript from '"+initSql+"'");
		 String result = "数据库初始化成功";
		 try{
			 dao.execute(sql);
		 }catch(Exception e){
			 result="数据库初始化出错了";
			 System.out.println(e);
		 }
		 return result;
	}
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
