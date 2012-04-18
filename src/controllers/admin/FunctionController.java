package controllers.admin;

import javax.servlet.ServletContext;

import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@At("/admin/function")
public class FunctionController {

	/**
	 * 初始化数据库
	 * @param ctx
	 * @return
	 */
	@Ok("jsp:views.admin.function.init")
	public String init(ServletContext ctx){
		
		 String initSql = ctx.getRealPath("/WEB-INF/classes/dbinit.sql");
		 Sql sql = Sqls.create("runscript from '"+initSql+"'");
		 String result = "数据库初始化成功";
		 try{
			 dao.execute(sql);
		 }catch(Exception e){
			 result="数据库初始化出错了";
			 log.error(e);
		 }
		 return result;
	}
	/**
	 * 执行sql语句，
	 * @param sql
	 * @param code
	 * @return
	 */
	@Ok("jsp:views.admin.function.execsql")
	public String execsql(@Param("sql")String sql,@Param("code")String code){
		if(Strings.isEmpty(sql) ){
			return "请输入验证码和要执行的SQL";
		}
		if(Strings.isEmpty(code) || !"tt64".equals(code)){
			return "验证码输入错误";
		}
		 String result = "执行成功";
		 try{
			 dao.execute( Sqls.create(sql));
		 }catch(Exception e){
			 result="执行出错";
			 log.error(e);
		 }
		 return result;
	}
	private static Log log = Logs.get();
	private Dao dao;
	public void setDao(Dao dao){
		this.dao = dao;
	}
}
