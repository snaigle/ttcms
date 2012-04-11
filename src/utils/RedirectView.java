package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nutz.mvc.View;

public class RedirectView implements View{
	private String url = "/";
	public RedirectView(String url){
		this.url = url;
	}
	@Override
	public void render(HttpServletRequest req, HttpServletResponse resp,
			Object obj) throws Throwable {
		resp.sendRedirect(url);
	}

}
