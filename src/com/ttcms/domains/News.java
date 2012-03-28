package com.ttcms.domains;

import java.util.Date;
import java.util.List;

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
	List<Tag> tags;	// 关键词
	@ManyMany(target=Category.class,relation="t_news_category",from="news_id",to="category_id")
	List<Category> categorys; // 新闻分类
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
	public List<Tag> getTags() {
		return tags;
	}
	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	public List<Category> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
