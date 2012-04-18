package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nutz.lang.Strings;
import org.nutz.mvc.View;
import org.nutz.mvc.view.ServerRedirectView;

public class CV {
	
	public final static String REDIRECT_OLD_URL = "REDIRECT_OLD_URL";
	public final static String REDIRECT_MESSAGE = "message";
	public static View redirect(String url,String message){
		return new Redirect(url, message);
	}
	public static View redirect(String url){
		return new ServerRedirectView(url);
	}

}
class Redirect extends ServerRedirectView{
	
	String message = null;
	public Redirect(String dest) {
		super(dest);
	}
	public Redirect(String dest,String message){
		super(dest);
		this.message = message;
	}
	@Override
	public void render(HttpServletRequest req, HttpServletResponse resp,
			Object obj) throws Exception {
		super.render(req, resp, obj);
		String referer = req.getHeader("Referer");
		if(! Strings.isEmpty(message) && !Strings.isEmpty(referer)){
			req.getSession().setAttribute(CV.REDIRECT_MESSAGE, message);
			req.getSession().setAttribute(CV.REDIRECT_OLD_URL, referer);
		}
	}
}
