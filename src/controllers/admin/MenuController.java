package controllers.admin;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import utils.CV;
import utils.LocalMessage;
import utils.form.PageForm;
import domains.Menu;

public class MenuController {

	@Ok(">>:/admin/menu/list")
	public void index(){
	}
	/**
	 * @return
	 */
	public PageForm<Menu> list(@Param("offset")int offset , @Param("max")int max ) {
		PageForm<Menu> pf = PageForm.getPaper(dao, Menu.class,null, offset, max);
		return pf;
	}
	public Object show(@Param("id")long id) {
		return dao.fetch(Menu.class, id);
	}
	public void create() {
	}
	@Ok(">>:/admin/menu/list")
	public Object save(@Param("..")Menu menu) {
		String message = "";
		if(menu != null){
				dao.insert(menu);
				message = "插入成功";
				return  message;
		}else{
			message = "校验不成功";
		}
		return CV.redirect("/menu/create", message);
	}
	public Object edit(@Param("id")long id) {
		Menu menu = dao.fetch(Menu.class,id);
		if(menu == null){
			return CV.redirect("/menu/list", "该"+LocalMessage.get("Menu.listName")+"不存在");
		}
		return menu;
	}
	@Ok(">>:/admin/menu/list")
	public Object update(@Param("..")Menu menu) {
		String message = "";
		if(menu.getId() != null){
				dao.update(menu);
				message = "更新成功";
		}else{
			message = "校验不成功,请重新输入";
			return CV.redirect("/menu/edit?id="+menu.getId(), message);
		}
		return  message;
	}
	@Ok(">>:/admin/menu/list")
	public Object delete(@Param("id")Long id) {
		dao.delete(Menu.class, id);
		return  "删除成功";
	}	
	@Ok(">>:/admin/menu/list")
	public Object deleteAll(@Param("ids")String ids) {
		if(!Strings.isEmpty(ids)){
			Sql sql = Sqls.create("delete from menu where id in ("+ids+")");
			dao.execute(sql);
		}
		return "删除成功";
	}
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}

