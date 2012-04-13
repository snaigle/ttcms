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
import domains.Category;

@At("/admin/category")
public class CategoryController {

	@Ok(">>:/admin/category/list")
	public void index(){
	}
	/**
	 * @return
	 */
	@Ok("jsp:views.admin.category.list")
	public PageForm<Category> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<Category> pf = PageForm.getPaper(dao, Category.class,null, offset, max);
		return pf;
	}
	@Ok("jsp:views.admin.category.create")
	public void create() {
	}
	@Ok(">>:/admin/Category/list")
	public void save(@Param("name")String name) {
		if(! Strings.isEmpty(name)){
			Category cat = dao.fetch(Category.class,name);
			if(cat == null){
				cat = new Category();
				cat.setName(name);
				dao.insert(cat);
			}
		}
	}
	@Ok("jsp:views.admin.category.edit")
	public Object edit(@Param("id")long id) {
		Category cat = dao.fetch(Category.class,id);
		if(cat == null){
			return new ServerRedirectView("/admin/category/list");
		}
		return cat;
	}
	@Ok(">>:/admin/category/list")
	public void update(@Param("id")Long id,@Param("name")String name) {
		if(Strings.isEmpty(name)){
			Category cat = dao.fetch(Category.class,id);
			if(cat!= null){
				cat.setName(name);
				dao.update(cat);
			}
		}
	}
	@Ok(">>:/admin/category/list")
	public void delete(@Param("id")Long id) {
		Sql tSql = Sqls.create("delete from t_news_category  where category_id ="+id);
		dao.execute(tSql);
		dao.delete(Category.class, id);
	}	
	@Ok(">>:/admin/category/list")
	public void deleteAll(@Param("ids")String ids) {
		if(!Strings.isEmpty(ids)){
			Sql tSql = Sqls.create("delete from t_news_category where category_id in ("+ids+")");
			Sql sql = Sqls.create("delete from category where id in ("+ids+")");
			dao.execute(tSql,sql);
		}
	}
	
	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
