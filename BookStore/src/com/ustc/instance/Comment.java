package com.ustc.instance;

import java.util.ArrayList;
import java.util.List;

public class Comment {

		private int comid;//评论的唯一标识id
		private String content;//评论的内容
		private String time;//评论的时间
		private int bid;//属于哪个书籍的评论的那个书籍的id
		private int id;//评论的用户的id；
		private int replynum;//评论回复的数量
		private int likes;//评论的点赞数量
		private int blt_comment;//这条评论是否是回复的他人，如果是则未改评论的comid，否则为0
		private int replyuid;//如果是回复他人的评论，则为他人的uid，否则为0
		private List<Comment> replyComment =new ArrayList<Comment>();
		public List<Comment> getReplyComment() {
			return replyComment;
		}
		private User commentOwner;//这条评论的拥有者
		private User userReplyTo;//回复的对象
		public User getCommentOwner() {
			return commentOwner;
		}
		public void setCommentOwner(User commentOwner) {
			this.commentOwner = commentOwner;
		}
		public User getUserReplyTo() {
			return userReplyTo;
		}
		public void setUserReplyTo(User userReplyTo) {
			this.userReplyTo = userReplyTo;
		}
		public void setReplyComment(List<Comment> replyComment) {
			this.replyComment = replyComment;
		}
		public int getComid() {
			return comid;
		}
		public void setComid(int comid) {
			this.comid = comid;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public int getBid() {
			return bid;
		}
		public void setBid(int bid) {
			this.bid = bid;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getReplynum() {
			return replynum;
		}
		public void setReplynum(int replynum) {
			this.replynum = replynum;
		}
		public int getLikes() {
			return likes;
		}
		public void setLikes(int likes) {
			this.likes = likes;
		}
		public int getBlt_comment() {
			return blt_comment;
		}
		public void setBlt_comment(int blt_comment) {
			this.blt_comment = blt_comment;
		}
		public int getReplyuid() {
			return replyuid;
		}
		public void setReplyuid(int replyuid) {
			this.replyuid = replyuid;
		}
}
