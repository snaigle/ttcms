package controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.nutz.castor.castor.Datetime2String;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import utils.RedirectView;
import utils.form.PageForm;
import domains.Category;
import domains.News;
import domains.Tag;

public class NewsController {

	@Ok(">>:/news/list")
	public void index(){
	}
	/**
	 * params: offset,max
	 * @return
	 */
	public PageForm<News> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,null, offset, max);
		for(News news : pf.getResults()){
			dao.fetchLinks(news, "tags");
			dao.fetchLinks(news, "categorys");
		}
		return pf;
	}
	/**
	 * params: offset,max,tag
	 * @return
	 */
	public PageForm<News>  listByTag(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,category
	 * @return
	 */
	public PageForm<News>  listByCategory(@Param("offset")int offset , @Param("max")int max,@Param("cat")int category) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
	}
	/**
	 * params: offset,max,keyword
	 * @return
	 */
	public PageForm<News> search(@Param("offset")int offset , @Param("max")int max,@Param("tag")int tag) {
		PageForm<News> pf = PageForm.getPaper(dao, News.class,Cnd.orderBy().desc("id"), offset, max);
		return pf;
	}
	public News create() {
		News news = new News();
		List<Tag> tags = dao.query(Tag.class, null, null);
		List<Category> cats = dao.query(Category.class,null,null);
		news.setTags(tags);
		news.setCategorys(cats);
		return news;
	}
	@Ok(">>:/news/list")
	public void save(@Param("title")String title,@Param("content")String content,@Param("tags")String tags,@Param("cats")String cats) {
		if(Strings.isEmpty(title)){
			title = new Datetime2String().cast(new Date(),null, "yyyy年MM月dd日")+"  留念";
		}
		if(Strings.isEmpty(content)){
			content = "";
		}
		News news = new News();
		news.setTitle(title);
		news.setContent(content);
		news.setCreateTime(new Date());
		
		List<Tag> tagLists  = null;
		if(Strings.isEmpty(tags)){
			tagLists = new ArrayList<Tag>();
		}else{
			String tagsIn = "'"+tags+"'";
			tagsIn.replaceAll(",", "','");
			// getTheExistsTags
			tagLists = dao.query(Tag.class, Cnd.wrap("name in ("+tagsIn+") order by id asc"), null);
			// new the last Tags
			String[] tagsArray = tags.split(",");
			for(int i = 0 ;i<tagsArray.length;i++){
				boolean isHas = false;
				for(Tag t : tagLists){
					if(t.getName().equals(tagsArray[i])){
						isHas = true;
						break;
					}
				}
				if(! isHas){
					Tag tmp = new Tag();
					tmp.setName(tagsArray[i]);
					dao.insert(tmp);
					tagLists.add(tmp);
				}
			}
		}
		news.setTags(tagLists);
		
		List<Category> catLists = null;
		if(Strings.isEmpty(cats)){
			 catLists = dao.query(Category.class, Cnd.orderBy().asc("id"), dao.createPager(1, 1));
		}else{
			String catsIn = "'"+cats + "'";
			catsIn.replaceAll(",","','");
			catLists= dao.query(Category.class, Cnd.wrap("name in ("+ catsIn +") order by id asc") , null);
			String[] catArray = cats.split(",");
			for(int i=0;i<catArray.length;i++){
				boolean isHas = false;
				for(Category c: catLists){
					if(c.getName().equals(catArray[i])){
						isHas = true;
						break;
					}
				}
				if(!isHas){
					Category cTmp = new Category();
					cTmp.setName(catArray[i]);
					dao.insert(cTmp);
					catLists.add(cTmp);
				}
			}
		}
		news.setCategorys(catLists);
		dao.insert(news);
		
		for(Tag tt : tagLists){
			 dao.insert("t_news_tag", Chain.make("news_id", news.getId()).add("tag_id", tt.getId()));
		}
		for(Category cc : catLists){
			dao.insert("t_news_category" , Chain.make("news_id", news.getId()).add("category_id", cc.getId()));
		}
	}
	public Object edit(@Param("id")long id) {
		News news = dao.fetch(News.class,id);
		if(news == null){
			// 提示出错
			return new RedirectView("/news/list");
		}
		dao.fetchLinks(news, "tags");
		dao.fetchLinks(news, "categorys");
		List<Tag> tags = dao.query(Tag.class, null, null);
		List<Category> cats = dao.query(Category.class,null,null);
		return news;
	}
	public void update() {
		
	}
	public void delete() {
		
	}
	public void deleteAll() {
		
	}

	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
