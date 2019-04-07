package com.ustc.fy;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.mchange.v2.codegen.bean.BeangenUtils;

/**
 * Servlet implementation class ByteServlet
 */
public class ByteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ByteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ServletOutputStream out = response.getOutputStream();
		String realPath = this.getServletContext().getRealPath("4.jpg");
		System.out.println(realPath);
		InputStream in=new FileInputStream(realPath);
		int len=0;
		byte[] buffer =new byte[1024];
		while((len=in.read(buffer))>0) {
			out.write(buffer,0,len);
		}
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
