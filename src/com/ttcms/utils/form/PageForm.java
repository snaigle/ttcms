package com.ttcms.utils.form;

import java.util.List;

public class PageForm {

	public List<Object>  results;
	public Integer total = 0;  // 总条数
	public Integer max = 0 ; // 每页大小
	public Integer offset = 0; // 当前页
}
