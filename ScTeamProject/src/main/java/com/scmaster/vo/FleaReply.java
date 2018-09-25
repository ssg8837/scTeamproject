package com.scmaster.vo;

public class FleaReply {
	private int fleaNum;
	private int replyNum ;
	private int userNo;
	private String userNick;
	private String userId;
	private String  replyText;
	private String replyregdate;
	
	public FleaReply() {
		// TODO Auto-generated constructor stub
	}

	public FleaReply(int fleaNum, int replyNum, int userNo, String userNick, String userId, String replyText,
			String replyregdate) {
		super();
		this.fleaNum = fleaNum;
		this.replyNum = replyNum;
		this.userNo = userNo;
		this.userNick = userNick;
		this.userId = userId;
		this.replyText = replyText;
		this.replyregdate = replyregdate;
	}

	@Override
	public String toString() {
		return "FleaReply [fleaNum=" + fleaNum + ", replyNum=" + replyNum + ", userNo=" + userNo + ", userNick="
				+ userNick + ", userId=" + userId + ", replyText=" + replyText + ", replyregdate=" + replyregdate + "]";
	}

	public int getFleaNum() {
		return fleaNum;
	}

	public void setFleaNum(int fleaNum) {
		this.fleaNum = fleaNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getReplyregdate() {
		return replyregdate;
	}

	public void setReplyregdate(String replyregdate) {
		this.replyregdate = replyregdate;
	}

	
	
}
