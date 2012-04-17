package utils;

import org.nutz.dao.Dao;

public class PluginUtil {

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
