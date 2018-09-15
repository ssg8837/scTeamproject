package com.scmaster.vo;

public class SNS_Reply {

	private int rplyNo;
	private int userNo;
	private int snsNo;
	private String userNick;
	private String content;
	private int parent_Rply;
	private String writeDate;
	
	private int imgExist;
	
	public SNS_Reply() {
		imgExist=0;
	}
	
	public SNS_Reply(int rplyNo,  int snsNo,int userNo,String userNick, String content, int parent_Rply,String writeDate) {
		this.rplyNo = rplyNo;
		this.userNo = userNo;
		this.snsNo = snsNo;
		this.userNick =userNick;
		this.content = content;
		this.parent_Rply = parent_Rply;
		this.writeDate = writeDate;
		imgExist=0;
	}

	public int getRplyNo() {
		return rplyNo;
	}

	public void setRplyNo(int rplyNo) {
		this.rplyNo = rplyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getParent_Rply() {
		return parent_Rply;
	}

	public void setParent_Rply(int parent_Rply) {
		this.parent_Rply = parent_Rply;
	}

	public int getSnsNo() {
		return snsNo;
	}

	public void setSnsNo(int snsNo) {
		this.snsNo = snsNo;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getImgExist() {
		return imgExist;
	}

	public void setImgExist(int imgExist) {
		this.imgExist = imgExist;
	}

	@Override
	public String toString() {
		return "SNS_Reply [rplyNo=" + rplyNo + ", userNo=" + userNo + ", snsNo=" + snsNo + ", userNick=" + userNick
				+ ", content=" + content + ", parent_Rply=" + parent_Rply + ", writeDate=" + writeDate + "]";
	}
}
