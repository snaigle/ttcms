package com.ttcms.domains;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("news")
public class News {
	@Id
	Long id;		// id
	@Name
	String title;		// 标题
	@Column
	String content;		// 内容
	@Column
	String keywords;	// 关键词
	@Column
	String category; // 新闻分类
}
