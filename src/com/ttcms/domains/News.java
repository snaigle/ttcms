package com.ttcms.domains;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
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
	@ManyMany(from="news_id",relation="t_news_tag",target=Tag.class,to="tag_id")
	Tag tags;	// 关键词
	@ManyMany(target=Category.class,relation="t_news_category",from="news_id",to="category_id")
	Category categorys; // 新闻分类
	@Column("create_time")
	Date createTime ;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Tag getTags() {
		return tags;
	}
	public void setTags(Tag tags) {
		this.tags = tags;
	}
	public Category getCategorys() {
		return categorys;
	}
	public void setCategorys(Category categorys) {
		this.categorys = categorys;
	}
	
}
