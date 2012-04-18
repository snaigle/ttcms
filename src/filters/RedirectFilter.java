package filters;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;

import utils.CV;

/**
 * Servlet Filter implementation class RorSiteMeshFilter
 */
public class RedirectFilter implements Filter{

	@Override
	public void destroy() {
		// nothing
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		String realPath = Mvcs.getRequestPathObject(req).getUrl();
		if (null != ignorePtn && !ignorePtn.matcher(realPath).find()) {
			HttpSession session  = req.getSession(true);
			String oldUrl = (String) session.getAttribute(CV.REDIRECT_OLD_URL);
			if(! Strings.isEmpty(oldUrl)){
				String referer = req.getHeader("Referer");
				if(!(Strings.isEmpty(referer) || ! oldUrl.equals(referer))){
					req.setAttribute(CV.REDIRECT_MESSAGE, session.getAttribute(CV.REDIRECT_MESSAGE));
				}
				session.setAttribute(CV.REDIRECT_OLD_URL, null);
				session.setAttribute(CV.REDIRECT_MESSAGE, null);
			}
		}
		arg2.doFilter(arg0, arg1);
	}

	private static final String IGNORE = "^.+\\.(jsp|png|gif|jpg|js|css|jspx|jpeg|swf)$";
	private Pattern ignorePtn;
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		ignorePtn = Pattern.compile(IGNORE,Pattern.CASE_INSENSITIVE);
	}

}
