package com.ustc.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.google.gson.Gson;
import com.ustc.instance.Comment;
import com.ustc.instance.User;
import com.ustc.service.CommentService;
import com.ustc.service.UserService;
import com.ustc.utils.c3p0Utils;

/**
 * Servlet implementation class CommentServlet
 */
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		switch (method) {
		case "getComment":
			getComment(request, response);
			break;
		case "addComment":
			addComment(request, response);
			break;
		case "deleteComment":
			deleteComment(request, response);
			break;
		case "clickLikes":
			clickLikes(request, response);
			break;
		case "showMessage":
			showMessage(request, response);
			break;
		case "getCommentByComid":
			getCommentByComid(request, response);
			break;
		case "showAllMessage":
			showAllMessage(request, response);
			break;
		default:
			break;
		}
	}

	private void showAllMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");

		List<Comment> comments = new ArrayList<>();
		QueryRunner qr = new QueryRunner(c3p0Utils.getDataSource());
		String sql = "select * from comment where replyuid=? order by time desc";
		try {
			comments = qr.query(sql, new BeanListHandler<Comment>(Comment.class), user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Comment comment : comments) {
			int replyid = comment.getReplyuid();
			User replyUser = getUser(replyid);
			comment.setUserReplyTo(replyUser);
			int commentOwner = comment.getId();
			User CommentOwner = getUser(commentOwner);
			comment.setCommentOwner(CommentOwner);
		}
		Gson gson = new Gson();
		String json = gson.toJson(comments);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
		
	}

	private void getCommentByComid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String comid = request.getParameter("comid");
		Comment comment = null;
		CommentService cs = new CommentService();
		comment = cs.getCommentByComid(comid);

		int Comid = comment.getComid();
		comment.setCommentOwner(getUser(comment.getId()));
		comment.setUserReplyTo(getUser(comment.getReplyuid()));
		List<Comment> replyList = new ArrayList<>();
		replyList = cs.getComment(comment.getBid() + "", Comid);
		for (Comment com : replyList) {
			com.setCommentOwner(getUser(com.getId()));
			com.setUserReplyTo(getUser(com.getReplyuid()));
		}
		comment.setReplyComment(replyList);
		Gson gson = new Gson();
		String json = gson.toJson(comment);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
	}

	private void showMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");

		List<Comment> comments = new ArrayList<>();
		QueryRunner qr = new QueryRunner(c3p0Utils.getDataSource());
		String sql = "select * from comment where replyuid=? order by time desc limit 0,5";
		try {
			comments = qr.query(sql, new BeanListHandler<Comment>(Comment.class), user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Comment comment : comments) {
			int replyid = comment.getReplyuid();
			User replyUser = getUser(replyid);
			comment.setUserReplyTo(replyUser);
			int commentOwner = comment.getId();
			User CommentOwner = getUser(commentOwner);
			comment.setCommentOwner(CommentOwner);
		}
		Gson gson = new Gson();
		String json = gson.toJson(comments);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
	}

	private void clickLikes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String like = request.getParameter("like");
		String comid = request.getParameter("comid");
		CommentService cs = new CommentService();
		int row = cs.clickLikes(like, comid);
		if (row > 0) {
			response.getWriter().write("{\"success\":\"yes\"}");
		}

	}

	private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String comid = request.getParameter("comid");
		CommentService cs = new CommentService();
		int row = cs.deleteComment(comid);
		if (row > 0) {
			String json = "{\"success\":\"success\"}";
			response.getWriter().write(json);
		}
	}

	private void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		data:{"content":oSize,"time":now,"bid":"${book.bid}","id":"${user.id}"},
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect("/BookStore/login.jsp");
			return;
		}

		Comment comment = new Comment();
		comment.setContent(request.getParameter("content"));
		comment.setTime(request.getParameter("time"));
		comment.setBid(Integer.parseInt(request.getParameter("bid")));
		comment.setId(Integer.parseInt(request.getParameter("id")));
		comment.setReplynum(Integer.parseInt(request.getParameter("replynum")));
		comment.setLikes(Integer.parseInt(request.getParameter("likes")));
		comment.setBlt_comment(Integer.parseInt(request.getParameter("blt_comment")));
		comment.setReplyuid(Integer.parseInt(request.getParameter("replyuid")));
//		private int replynum;//评论回复的数量
//		private int likes;//评论的点赞数量
//		private int blt_comment;//这条评论是否是回复的他人，如果是则未改评论的comid，否则为0
//		private int replyuid;//如果是回复他人的评论，则为他人的uid，否则为0
//		

		CommentService cs = new CommentService();
		int row = cs.addComment(comment);
		Comment comment1 = null;
		if (row > 0) {
			QueryRunner qr = new QueryRunner(c3p0Utils.getDataSource());
			String sql = "select * from comment where time=?";

			try {
				comment1 = qr.query(sql, new BeanHandler<Comment>(Comment.class), comment.getTime());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Gson gson = new Gson();
			String json = gson.toJson(comment1);
			response.getWriter().write(json);
		} else {
			response.getWriter().write("");
		}
	}

	public User getUser(int id) {
		QueryRunner qr = new QueryRunner(c3p0Utils.getDataSource());
		String sql = "select * from user where id=?";
		User user = null;
		try {
			user = qr.query(sql, new BeanHandler<User>(User.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	private void getComment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bid = request.getParameter("bid");
		List<Comment> commentList = new ArrayList<>();
		CommentService cs = new CommentService();
		commentList = cs.getComment(bid, 0);
		if (commentList != null)
			for (Comment comment : commentList) {
				int comid = comment.getComid();
				comment.setCommentOwner(getUser(comment.getId()));
				comment.setUserReplyTo(getUser(comment.getReplyuid()));
				List<Comment> replyList = new ArrayList<>();
				replyList = cs.getComment(bid, comid);
				for (Comment com : replyList) {
					com.setCommentOwner(getUser(com.getId()));
					com.setUserReplyTo(getUser(com.getReplyuid()));
				}
				comment.setReplyComment(replyList);
			}
		UserService us = new UserService();

		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("/book.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
