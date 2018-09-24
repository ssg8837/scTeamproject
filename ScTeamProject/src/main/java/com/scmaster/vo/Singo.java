package com.scmaster.vo;

public class Singo {
	private int SNSNo;
	private int userNo;
	
	public Singo() {
	}
	public Singo(int sNSNo, int userNo) {
		SNSNo = sNSNo;
		this.userNo = userNo;
	}
	public int getSNSNo() {
		return SNSNo;
	}
	public void setSNSNo(int sNSNo) {
		SNSNo = sNSNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
