package utils.xmlrpc.api;

import java.util.HashMap;
import java.util.Map;

import utils.xmlrpc.client.XmlrpcClient;

public class Osc {

    public static boolean init = false;
    private static String username;
    private static String password;
    private static String host;
    private static XmlrpcClient client = null;

    static {
        init("http://my.oschina.net/action/xmlrpc", "feiyan35488@gmail.com",
                "354888");
    }

    public static void init(String host, String username, String password) {
        Osc.host = host;
        Osc.username = username;
        Osc.password = password;
        refresh();
    }

    public static void refresh() {
        client = new XmlrpcClient(host);
        init = true;
    }

    public static String publish(String title, String content) {
        Map<String, Object> post = new HashMap<String, Object>();
        post.put("title", title);
        post.put("description", content);
        return client.execute("wp.newPost", new Object[] { "1", username,
                password, post, true });
    }
}
