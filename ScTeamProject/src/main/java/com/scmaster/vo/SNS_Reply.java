package com.scmaster.vo;

public class SNS_Reply {

	private int rplyNo;
	private int userNo;
	private String content;
	private int parent_Rply;
	
	public SNS_Reply(int rplyNo, int userNo, String content, int parent_Rply) {
		this.rplyNo = rplyNo;
		this.userNo = userNo;
		this.content = content;
		this.parent_Rply = parent_Rply;
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

	@Override
	public String toString() {
		return "SNS_Reply [rplyNo=" + rplyNo + ", userNo=" + userNo + ", content=" + content + ", parent_Rply="
				+ parent_Rply + "]";
	}
	
}
