package utils;

import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;

public class CndUtil {
	/**
     * 简单合并2个Cnd,以第一个Cnd的值为先
     */
  public static Condition merge(Cnd first, String[] orderby) {
    if(first == null && orderby == null){
    	return null;
    }
    if(orderby == null || orderby.length == 0) return first;
    Cnd cnd = null;
    if(first != null){
    	cnd = first;
    }else{
    	cnd = Cnd.where("1", "=", "1");
    }
    if(orderby.length == 1){
    	return cnd.desc(orderby[0]);
    }else{
    	if("asc".equalsIgnoreCase(orderby[1])){
    		cnd.asc(orderby[0]);
    	}else {
    		cnd.desc(orderby[0]);
    	}
    	return cnd;
    }
  }
}
