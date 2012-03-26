package com.ttcms.utils.form;

import java.util.List;

import org.nutz.dao.pager.Pager;

public class PageForm {

	private List<Object>  results;
	private Pager pager ;
	public List<Object> getResults() {
		return results;
	}
	public void setResults(List<Object> results) {
		this.results = results;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
}
