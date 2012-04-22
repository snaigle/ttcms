package controllers.admin;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import utils.CV;
import utils.form.PageForm;
import domains.Tag;

public class TagController {

	@Ok(">>:/admin/tag/list")
	public void index(){
	}
	/**
	 * @return
	 */
	public PageForm<Tag> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<Tag> pf = PageForm.getPaper(dao, Tag.class,null, offset, max);
		return pf;
	}
	public void create() {
	}
	@Ok(">>:/admin/tag/list")
	public Object save(@Param("name")String name) {
		String message = "";
		if(! Strings.isEmpty(name)){
			Tag tag = dao.fetch(Tag.class,name);
			if(tag == null){
				tag = new Tag();
				tag.setName(name);
				dao.insert(tag);
				message = "插入成功";
				return CV.redirect("/admin/tag/list", message);
			}else{
				message = "此标签名称已经存在";
			}
		}else{
			message = "标签名称不能为空";
		}
		return CV.redirect("/admin/tag/create", message);
	}
	public Object edit(@Param("id")long id) {
		Tag tag = dao.fetch(Tag.class,id);
		if(tag == null){
			return CV.redirect("/admin/tag/list", "此标签不存在");
		}
		return tag;
	}
	@Ok(">>:/admin/tag/list")
	public Object update(@Param("id")Long id,@Param("name")String name) {
		String message = "";
		if(! Strings.isEmpty(name)){
			Tag tag = dao.fetch(Tag.class,id);
			if(tag!= null){
				tag.setName(name);
				dao.update(tag);
				message = "更新成功";
			}else{
				message = "此标签不存在";
			}
		}else{
			message = "标签名称不能为空";
			return CV.redirect("/admin/tag/edit?id="+id, message);
		}
		return CV.redirect("/admin/tag/list", message);
	}
	@Ok(">>:/admin/tag/list")
	public Object delete(@Param("id")Long id) {
		Sql tSql = Sqls.create("delete from t_news_tag where tag_id ="+id);
		dao.execute(tSql);
		dao.delete(Tag.class, id);
		return CV.redirect("/admin/tag/list", "删除成功");
	}	
	@Ok(">>:/admin/tag/list")
	public Object deleteAll(@Param("ids")String ids) {
		if(!Strings.isEmpty(ids)){
			Sql tSql = Sqls.create("delete from t_news_tag where tag_id in ("+ids+")");
			Sql sql = Sqls.create("delete from tag where id in ("+ids+")");
			dao.execute(tSql,sql);
		}
		return CV.redirect("/admin/tag/list", "删除成功");
	}
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
