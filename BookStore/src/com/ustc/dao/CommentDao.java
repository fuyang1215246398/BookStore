package com.ustc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.ustc.instance.Comment;
import com.ustc.utils.c3p0Utils;

public class CommentDao {

	public List<Comment> getComment(String bid, int i) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from comment where bid=? and blt_comment=? order by time desc";
		
		return qr.query(sql, new BeanListHandler<Comment>(Comment.class),bid,i);
		 
	}

	public int addComment(Comment comment) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="insert into comment values(null,?,?,?,?,?,?,?,?)";
		int row=qr.update(sql, comment.getContent(),comment.getTime(),comment.getBid(),comment.getId(),comment.getReplynum(),
				comment.getLikes(),comment.getBlt_comment(),comment.getReplyuid()
				);
		
		 
		return row;
	}

	public int deleteComment(String comid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="delete from comment where comid=? or blt_comment=?";
		int update = qr.update(sql,comid,comid);
		return update;
	}

	public int clickLikes(String like, String comid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="";
		if(like.equals("true"))
		sql="update comment set likes=likes+1 where comid=?";
		else 
			sql="update comment set likes=likes-1 where comid=?";
		int update = qr.update(sql,comid);
		return update;
	}

	public Comment getCommentByComid(String comid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from comment where comid=?";
		Comment query = qr.query(sql, new BeanHandler<Comment>(Comment.class),comid);
		return query;
	}

}
