package com.scmaster.vo;

public class BS_User {
	private int userNo; 
    private String userType;
    private String userId; 
    private String userPwd ;
    private String userAddr;
    private String userEmail;
    private String userPhone;
    private String userNick;
	private String userOriginalFile;
	private String userSavedFile;
    
	public BS_User() {
	}

	public BS_User(int userNo, String userType, String userId, String userPwd, String userAddr, String userEmail,
			String userPhone, String userNick, String userOriginalFile, String userSavedFile) {
		this.userNo = userNo;
		this.userType = userType;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userAddr = userAddr;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userNick = userNick;
		this.userOriginalFile = userOriginalFile;
		this.userSavedFile = userSavedFile;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserOriginalFile() {
		return userOriginalFile;
	}

	public void setUserOriginalFile(String userOriginalFile) {
		this.userOriginalFile = userOriginalFile;
	}

	public String getUserSavedFile() {
		return userSavedFile;
	}

	public void setUserSavedFile(String userSavedFile) {
		this.userSavedFile = userSavedFile;
	}

	@Override
	public String toString() {
		return "BS_User [userNo=" + userNo + ", userType=" + userType + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", userAddr=" + userAddr + ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userNick="
				+ userNick + ", userOriginalFile=" + userOriginalFile + ", userSavedFile=" + userSavedFile + "]";
	}

    
}
