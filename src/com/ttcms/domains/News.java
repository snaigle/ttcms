package com.ttcms.domains;

import org.nutz.dao.entity.annotation.Table;

@Table("news")
public class News {
	Long id;		// id
	String title;		// 标题
	String content;		// 内容
	String keywords;	// 关键词
	String category; // 新闻分类
}
