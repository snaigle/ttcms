package com.ttcms.controllers;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.pager.Pager;

import com.ttcms.domains.News;
import com.ttcms.utils.form.PageForm;

public class NewsController {

	public void index(){
		
	}
	/**
	 * params: offset,max
	 * @return
	 */
	public String list() {
		PageForm pf = new PageForm();
		Pager pager =  dao.createPager(0,0);
		List<News> results= dao.query(News.class, Cnd.orderBy().desc("createTime"),pager);
		int total = dao.count(News.class);
		if(total == 0)
			return "empty";
		return "say hello";
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public String listByTag() {
		PageForm pf = new PageForm();
		Pager pager =  dao.createPager(0,0);
		List<News> results= dao.query(News.class, Cnd.orderBy().desc("createTime"),pager);
		int total = dao.count(News.class);
		if(total == 0)
			return "empty";
		return "say hello";
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public String listByCategory() {
		PageForm pf = new PageForm();
		Pager pager =  dao.createPager(0,0);
		List<News> results= dao.query(News.class, Cnd.orderBy().desc("createTime"),pager);
		int total = dao.count(News.class);
		if(total == 0)
			return "empty";
		return "say hello";
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
