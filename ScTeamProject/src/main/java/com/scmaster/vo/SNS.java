package com.scmaster.vo;

public class SNS {
	private int SNSNo; 
	private int userNo;
	private String userNick;
	private int permission;
	private String content;
	private int likely;
	private int photoCount;
	private String photo_1;
	private String photo_2;
	private String photo_3;
	private String photo_4;
	private String writeDate;
	
	
	public SNS() {
	}


	public SNS(int sNSNo, int userNo, String userNick, int permission, String content, int likely, int photoCount,
			String photo_1, String photo_2, String photo_3, String photo_4, String writeDate) {
		super();
		SNSNo = sNSNo;
		this.userNo = userNo;
		this.userNick = userNick;
		this.permission = permission;
		this.content = content;
		this.likely = likely;
		this.photoCount = photoCount;
		this.photo_1 = photo_1;
		this.photo_2 = photo_2;
		this.photo_3 = photo_3;
		this.photo_4 = photo_4;
		this.writeDate = writeDate;
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


	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}


	public int getPermission() {
		return permission;
	}


	public void setPermission(int permission) {
		this.permission = permission;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getLikely() {
		return likely;
	}


	public void setLikely(int likely) {
		this.likely = likely;
	}


	public int getPhotoCount() {
		return photoCount;
	}


	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}


	public String getPhoto_1() {
		return photo_1;
	}


	public void setPhoto_1(String photo_1) {
		this.photo_1 = photo_1;
	}


	public String getPhoto_2() {
		return photo_2;
	}


	public void setPhoto_2(String photo_2) {
		this.photo_2 = photo_2;
	}


	public String getPhoto_3() {
		return photo_3;
	}


	public void setPhoto_3(String photo_3) {
		this.photo_3 = photo_3;
	}


	public String getPhoto_4() {
		return photo_4;
	}


	public void setPhoto_4(String photo_4) {
		this.photo_4 = photo_4;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
}
