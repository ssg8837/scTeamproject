package com.scmaster.vo;

public class Flea {
	private int userNo;
	private String userId; 
	private String userNick;
	private String userPhone;
	private String userAddr;
    private String userEmail;
    private int fleaNum;
    private String fleaTitle;
    private String fleaText;
    private String regdate;
    private int hitcount;
	private String fleaSavedFile;
	
	public Flea() {}

	public Flea(int userNo, String userId, String userNick, String userPhone, String userAddr, String userEmail,
			int fleaNum, String fleaTitle, String fleaText, String regdate, int hitcount, String fleaSavedFile) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userAddr = userAddr;
		this.userEmail = userEmail;
		this.fleaNum = fleaNum;
		this.fleaTitle = fleaTitle;
		this.fleaText = fleaText;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.fleaSavedFile = fleaSavedFile;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getFleaNum() {
		return fleaNum;
	}

	public void setFleaNum(int fleaNum) {
		this.fleaNum = fleaNum;
	}

	public String getFleaTitle() {
		return fleaTitle;
	}

	public void setFleaTitle(String fleaTitle) {
		this.fleaTitle = fleaTitle;
	}

	public String getFleaText() {
		return fleaText;
	}

	public void setFleaText(String fleaText) {
		this.fleaText = fleaText;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getFleaSavedFile() {
		return fleaSavedFile;
	}

	public void setFleaSavedFile(String fleaSavedFile) {
		this.fleaSavedFile = fleaSavedFile;
	}

	@Override
	public String toString() {
		return "Flea [userNo=" + userNo + ", userId=" + userId + ", userNick=" + userNick + ", userPhone=" + userPhone
				+ ", userAddr=" + userAddr + ", userEmail=" + userEmail + ", fleaNum=" + fleaNum + ", fleaTitle="
				+ fleaTitle + ", fleaText=" + fleaText + ", regdate=" + regdate + ", hitcount=" + hitcount
				+ ", fleaSavedFile=" + fleaSavedFile + "]";
	}


	
}
