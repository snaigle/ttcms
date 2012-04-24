package utils;

import org.nutz.dao.Dao;
import org.nutz.lang.util.Context;

public class PluginUtil {

	public static void getAllCount(Dao dao,Context ctx){
		ctx.set("p_tags", PluginUtil.getTagsCount(dao));
		ctx.set("p_cats", PluginUtil.getCatsCount(dao));
		ctx.set("p_date", PluginUtil.getDateCount(dao));
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
}
