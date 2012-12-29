package utils;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.nutz.lang.Strings;

public class HtmlCleaner {
	public static String clean(String input) {
		if (Strings.isEmpty(input)) {
			return input;
		}
		return Jsoup.clean(input, Whitelist.relaxed());
	}
}
