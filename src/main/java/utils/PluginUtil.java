package utils;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.lang.util.Context;

import domains.Menu;

public class PluginUtil {

	public static void getAllCount(Dao dao,Context ctx){
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
		ctx.set("p_menu", PluginUtil.getMenu(dao));
	}
	
	public static Object getTagsCount(Dao dao){
		
		return dao.query("v_tags", null, null);
	}
	public static Object getCatsCount(Dao dao){
		
		return dao.query("v_cats", null, null);
	}
	public static Object getDateCount(Dao dao){
		
		return dao.query("v_date", null, null);
	}
	public static Object getMenu(Dao dao){
		Object menus = CacheManager.get("menu");
		if(menus == null){
			menus = dao.query(Menu.class,Cnd.where("mtype", "=", "menu").asc("morder"));
			//CacheManager.put("menu", menus);
		}
		return menus;
	}
}
