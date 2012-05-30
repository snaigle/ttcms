package controllers;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nutz.lang.random.StringGenerator;
import org.nutz.mvc.annotation.Ok;

public class CommonController {

	@Ok("void")
	public void verifyCode(HttpSession session,HttpServletResponse resp){
		try {
			resp.setContentType("image/png");
			session.setAttribute("verifyCode", generateImage(resp.getOutputStream(),100,28,5));
		} catch (IOException e) {
			// TODO 这里还不知道该做些什么，出错了也没办法再处理，等用户刷新吧
		}
	}
	private String generateImage(OutputStream os,int width,int height,int keyLength) throws IOException{

		Random r = new Random();
		BufferedImage bi = new BufferedImage(width,height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 =  (Graphics2D) bi.getGraphics();
		g2.setColor(Color.WHITE);
		g2.drawRect(0, 0, width, height);
		// 添加 5条干扰线
		for(int i=0;i<5;i++){
			g2.setColor(new Color(150+r.nextInt(50), 150+r.nextInt(50), 150+r.nextInt(50)));
			int y = r.nextInt(height-10);
			g2.drawLine(0, y, width, y+10);
		}
		g2.setFont(new Font("Arial", Font.ITALIC, 28));
		g2.setColor(new Color(150+r.nextInt(50), 150+r.nextInt(50), 150+r.nextInt(50)));
		String key = new StringGenerator(keyLength,keyLength).next();
		g2.drawString(key, 5, height-5);
		ImageIO.write(bi, "png", os);
		return key;
	}
}
