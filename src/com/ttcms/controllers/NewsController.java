package com.ttcms.controllers;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.pager.Pager;
import org.nutz.mvc.annotation.Param;

import com.ttcms.domains.News;
import com.ttcms.utils.form.PageForm;

public class NewsController {

	public void index(){
		
	}
	/**
	 * params: offset,max
	 * @return
	 */
	public PageForm<News> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("createTime"), offset, max);
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
	public String search() {
		PageForm pf = new PageForm();
		Pager pager =  dao.createPager(0,0);
		List<News> results= dao.query(News.class, Cnd.orderBy().desc("createTime"),pager);
		int total = dao.count(News.class);
		if(total == 0)
			return "empty";
		return "say hello";
	}
	public void show() {
		
	}
	public void save() {
		
	}
	public void edit() {
		
	}
	public void update() {
		
	}
	public void delete() {
		
	}
	public void deleteAll() {
		
	}
	
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
