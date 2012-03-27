package com.ttcms.utils.form;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.Dao;
import org.nutz.dao.pager.Pager;

import com.ttcms.controllers.MainModule;

public class PageForm<T> {

	private List<T>  results;
	private Pager pager ;
	public List<T> getResults() {
		return results;
	}
	public void setResults(List<T> results) {
		this.results = results;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public static <T> PageForm<T> getPaper(Dao dao,Class<T> clazz,Condition cnd,int offset,int max){
		  PageForm<T> pf = new PageForm<T>();
		  if (offset<1) offset = 1;
		  if(max <1 ) max = MainModule.max;
		  Pager pager = dao.createPager(offset,max);
		  List<T> results = dao.query(clazz, cnd, pager);
		  int count = dao.count(clazz,cnd);
		  pager.setRecordCount(count);
		  pf.setPager(pager);
		  pf.setResults(results);
		  return pf;
	}
}