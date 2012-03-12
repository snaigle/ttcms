package com.ttcms.controllers;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;

import com.ttcms.domains.News;
import com.ttcms.utils.form.PageForm;

public class NewsController {

	public void index(){
		
	}
	public String list() {
		
		PageForm pf = new PageForm();
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
