package com.scmaster.vo;

public class Likely {
	private int userNo;
	private int snsNo;
	
	public Likely()
	{	
	}
	public Likely(int userNo, int snsNo) {
		this.userNo = userNo;
		this.snsNo = snsNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getSnsNo() {
		return snsNo;
	}
	public void setSnsNo(int snsNo) {
		this.snsNo = snsNo;
	}
	
	
}
