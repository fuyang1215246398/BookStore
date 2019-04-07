package com.ustc.web;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class VertifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Random r = new Random();
    private static char[] chs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
    private static final int NUMBER_OF_CHS = 4;
    private static final int IMG_WIDTH = 65;
    private static final int IMG_HEIGHT = 25;
    
    public VertifyServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "vertifyImg":
			getVertifyImg(request,response);
			break;
		case  "vertifyCode":
			getVertifyCode(request,response);
			break;
		default:
			break;
		}
		
		
		                    // 向页面输出图像
	}

	private void getVertifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String vertifyCode=(String) request.getSession().getAttribute("vertify").toString();
		String clientCode=request.getParameter("code");
		boolean isequal=vertifyCode.equals(clientCode);
		String json="{\"isequal\":"+isequal+"}";
		//"{\"isExist\":"+isExist+"}"
		response.getWriter().write(json);
	}

	private void getVertifyImg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB);    // 实例化BufferedImage
        Graphics g = image.getGraphics();
        Color c = new Color(200, 200, 255);                                             // 验证码图片的背景颜色                                        
        g.setColor(c);
        g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT);                                        // 图片的边框
        
        StringBuffer sb = new StringBuffer();                                           // 用于保存验证码字符串
        int index;                                                                      // 数组的下标
        for (int i = 0; i < NUMBER_OF_CHS; i++) {
            index = r.nextInt(chs.length);                                              // 随机一个下标
            g.setColor(new Color(r.nextInt(88), r.nextInt(210), r.nextInt(150)));       // 随机一个颜色
            g.drawString(chs[index] + "", 15 * i + 3, 18);                              // 画出字符
            sb.append(chs[index]);                                                      // 验证码字符串
        }
        
       
        request.getSession().setAttribute("vertify", sb.toString());                    // 将验证码字符串保存到session中
        ImageIO.write(image, "jpg", response.getOutputStream());    
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
