package com.ustc.fy;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownServlet
 */
public class DownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String file = request.getParameter("filename");
		//获得中文编码
		String filename=new String(file.getBytes("ISO8859-1"),"UTF-8");
//		System.out.println(filename);
		//设置Content-type告知客户端使用何种码表
		response.setContentType("text/html;charset=UTF-8");
		//要下载的这个文件的类型---客户端通过文件的MIME类型进行区分
		response.setContentType(this.getServletContext().getMimeType(filename));
		//告诉客户端该文件不是直接解析，而是以附件的形式下载
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		String realPath = this.getServletContext().getRealPath(filename);
		InputStream in=new FileInputStream(realPath);
		ServletOutputStream out = response.getOutputStream();
		int len=0;
		byte[] buffer=new byte[1024];
		while((len=in.read(buffer))>0) {
			out.write(buffer,0,len);}
		in.close();
		out.close();
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
