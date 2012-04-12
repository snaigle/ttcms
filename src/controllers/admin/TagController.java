package controllers.admin;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.ServerRedirectView;

import utils.form.PageForm;
import domains.Tag;

@At("/admin/tag")
public class TagController {

	@Ok(">>:/admin/tag/list")
	public void index(){
	}
	/**
	 * @return
	 */
	@Ok("jsp:admin.tag.list")
	public PageForm<Tag> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<Tag> pf = PageForm.getPaper(dao, Tag.class,null, offset, max);
		return pf;
	}
	@Ok("jsp:admin.tag.create")
	public void create() {
	}
	@Ok(">>:/admin/tag/list")
	public void save(@Param("name")String name) {
		if(! Strings.isEmpty(name)){
			Tag tag = dao.fetch(Tag.class,name);
			if(tag == null){
				tag = new Tag();
				tag.setName(name);
				dao.insert(tag);
			}
		}
	}
	@Ok("jsp:admin.tag.edit")
	public Object edit(@Param("id")long id) {
		Tag tag = dao.fetch(Tag.class,id);
		if(tag == null){
			return new ServerRedirectView("/admin/tag/list");
		}
		return tag;
	}
	@Ok(">>:/admin/tag/list")
	public void update(@Param("id")Long id,@Param("name")String name) {
		if(Strings.isEmpty(name)){
			Tag tag = dao.fetch(Tag.class,id);
			if(tag!= null){
				tag.setName(name);
				dao.update(tag);
			}
		}
	}
	@Ok(">>:/admin/tag/list")
	public void delete(@Param("id")Long id) {
		Sql tSql = Sqls.create("delete from t_news_tag where tag_id ="+id);
		dao.execute(tSql);
		dao.delete(Tag.class, id);
	}	
	@Ok(">>:/admin/tag/list")
	public void deleteAll(@Param("ids")String ids) {
		if(!Strings.isEmpty(ids)){
			Sql tSql = Sqls.create("delete from t_news_tag where tag_id in ("+ids+")");
			Sql sql = Sqls.create("delete from tag where id in ("+ids+")");
			dao.execute(tSql,sql);
		}
	}
	
	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
