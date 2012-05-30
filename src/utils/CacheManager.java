package utils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.nutz.lang.Strings;

public class CacheManager {

	private static Map<String, Object> container = new ConcurrentHashMap<String, Object>();
	private static final String MENU_PREFIX = "MEMU_";
	
	public static Object get(String key){
		if(Strings.isEmpty(key)) return null;
		return container.get(MENU_PREFIX+key);
	}
	/**
	 * key must be not empty
	 * @param key
	 * @return
	 */
	public static Object put(String key,Object value){
		if(Strings.isEmpty(key)) return null;
		return container.put(MENU_PREFIX+key, value);
	}
	public static Object remove(String key){
		if(Strings.isEmpty(key)) return null;
		return container.remove(MENU_PREFIX+key);
	}
}
