package net.tt.utils.xmlrpc.client;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import utils.xmlrpc.client.XmlrpcClient;

public class XmlrpcClientTest {

	String oschina = "http://my.oschina.net/action/xmlrpc";

	@Test
	public void testExecute() {
		XmlrpcClient client = new XmlrpcClient(oschina);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", "xmlrpc测试12");
		map.put("description", "xmlrpc 测试内容12");
		String postId = client.execute("wp.newPost", new Object[] { "1",
				"feiyan35488@gmail.com", "354888", map, true });
		System.out.println(postId);
	}
}
