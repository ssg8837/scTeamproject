package com.scmaster.vo;

public class AdminSNS {
	private int SNSNo; 
	private int userNo;
	private String writeDate;
	private int count;
	
	public AdminSNS() {
		// TODO Auto-generated constructor stub
	}

	public AdminSNS(int sNSNo, int userNo, String writeDate, int count) {
		super();
		SNSNo = sNSNo;
		this.userNo = userNo;
		this.writeDate = writeDate;
		this.count = count;
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
