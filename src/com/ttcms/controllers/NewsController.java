package com.ttcms.controllers;

import java.util.ArrayList;
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
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.ttcms.domains.Category;
import com.ttcms.domains.News;
import com.ttcms.domains.Tag;
import com.ttcms.utils.form.PageForm;

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
	@Ok(">>:/news/list")
	public void save(@Param("title")String title,@Param("content")String content,@Param("tags")String tags,@Param("cats")String cats) {
		log.debug("save start");
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
			tagLists = new ArrayList<Tag>();
		}else{
			String tagsIn = "'"+tags+"'";
			tagsIn.replaceAll(",", "','");
			// getTheExistsTags
			tagLists = dao.query(Tag.class, Cnd.wrap("name in ("+tagsIn+") order by id asc"), null);
			// new the last Tags
			String[] tagsArray = tags.split(",");
			List<Tag> tagsTemp = new ArrayList<Tag>();
			for(int i = 0 ;i<tagsArray.length;i++){
				boolean isHas = false;
				for(Tag t : tagLists){
					if(t.getName().equals(tagsArray[i])){
						isHas = true;
						break;
					}
				}
				if(! isHas){
					Tag tmp = new Tag();
					tmp.setName(tagsArray[i]);
					tagsTemp.add(tmp);
				}
			}
			tagLists.addAll(tagsTemp);
		}
		news.setTags(tagLists);
		
		List<Category> catLists = null;
		if(Strings.isEmpty(cats)){
			 catLists = dao.query(Category.class, Cnd.orderBy().asc("id"), dao.createPager(1, 1));
		}else{
			String catsIn = "'"+cats + "'";
			catsIn.replaceAll(",","','");
			catLists= dao.query(Category.class, Cnd.wrap("name in ("+ catsIn +") order by id asc") , null);
			String[] catArray = cats.split(",");
			List<Category>  catTemp = new ArrayList<Category>();
			for(int i=0;i<catArray.length;i++){
				boolean isHas = false;
				for(Category c: catLists){
					if(c.getName().equals(catArray[i])){
						isHas = true;
						break;
					}
				}
				if(!isHas){
					Category cTmp = new Category();
					cTmp.setName(catArray[i]);
					catTemp.add(cTmp);
				}
			}
			catLists.addAll(catTemp);
		}
		news.setCategorys(catLists);
		log.debug("insert start");
		dao.insertWith(news, null);
		log.debug("insert stop");
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
			 log.error(e);
		 }
		 return result;
	}
	public String execsql(@Param("sql")String sql,@Param("code")String code){
		if(Strings.isEmpty(sql) ){
			return "";
		}
		if(Strings.isEmpty(code) || !"tt64".equals(code)){
			return "code error";
		}
		 String result = "exec 成功";
		 try{
			 dao.execute( Sqls.create(sql));
		 }catch(Exception e){
			 result="exec 出错";
			 log.error(e);
		 }
		 return result;
	}
	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
