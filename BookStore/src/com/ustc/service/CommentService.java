package com.ustc.service;

import java.sql.SQLException;
import java.util.List;

import com.ustc.dao.CommentDao;
import com.ustc.instance.Comment;

public class CommentService {

	public List<Comment> getComment(String bid, int i) {
		CommentDao dao= new CommentDao();
		try {
			return dao.getComment(bid,i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int addComment(Comment comment) {
		CommentDao dao= new CommentDao();
		try {
			return dao.addComment(comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteComment(String comid) {
		CommentDao dao= new CommentDao();
		try {
			return dao.deleteComment(comid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

	public int clickLikes(String like, String comid) {
		CommentDao dao= new CommentDao();
		try {
			return dao.clickLikes(like,comid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Comment getCommentByComid(String comid) {
		CommentDao dao= new CommentDao();
		try {
			return dao.getCommentByComid(comid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
