package controllers.admin;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import utils.CV;
import utils.form.PageForm;
import domains.Category;

public class CategoryController {

	@Ok(">>:/admin/category/list")
	public void index(){
	}
	/**
	 * @return
	 */
	public PageForm<Category> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<Category> pf = PageForm.getPaper(dao, Category.class,null, offset, max);
		return pf;
	}
	public void create() {
	}
	@Ok(">>:/admin/category/list")
	public Object save(@Param("name")String name) {
		String message = null;
		if(! Strings.isEmpty(name)){
			Category cat = dao.fetch(Category.class,name);
			if(cat == null){
				cat = new Category();
				cat.setName(name);
				dao.insert(cat);
				message = "插入成功";
				return message;
			}else{
				message = "此分类名称已存在";
			}
		}else{
			message = "分类名称不能为空";
		}
		return CV.redirect("/admin/category/create",message);
	}
	public Object edit(@Param("id")long id) {
		Category cat = dao.fetch(Category.class,id);
		if(cat == null){
			return CV.redirect("/admin/category/list","该类别不存在");
		}
		return cat;
	}
	@Ok(">>:/admin/category/list")
	public Object update(@Param("id")Long id,@Param("name")String name) {
		String message = null; 
		if(! Strings.isEmpty(name)){
			Category cat = dao.fetch(Category.class,id);
			if(cat!= null){
				cat.setName(name);
				dao.update(cat);
				message = "更新成功";
			}else{
				message = "此分类不存在";
			}
		}else{
			message = "分类名称不能为空";
			return CV.redirect("/admin/category/edit?id="+id, message);
		}
		return message;
	}
	@Ok(">>:/admin/category/list")
	public Object delete(@Param("id")Long id) {
		Sql tSql = Sqls.create("delete from t_news_category  where category_id ="+id);
		dao.execute(tSql);
		dao.delete(Category.class, id);
		return  "删除成功";
	}	
	@Ok(">>:/admin/category/list")
	public Object deleteAll(@Param("ids")String ids) {
		if(!Strings.isEmpty(ids)){
			Sql tSql = Sqls.create("delete from t_news_category where category_id in ("+ids+")");
			Sql sql = Sqls.create("delete from category where id in ("+ids+")");
			dao.execute(tSql,sql);
		}
		return "删除成功";
	}
	
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
