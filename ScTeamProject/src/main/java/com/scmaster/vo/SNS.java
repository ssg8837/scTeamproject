package com.scmaster.vo;

public class SNS {
	private int SNSNo; 
	private int userNo;
	private int permission;
	private String content;
	private int likely;
	private int photoCount;
	private String photoGroup;
	private String writeDate;
	
	public SNS(int SNSNo, int userNo, int permission, String content, int likely, int photoCount, String photoGroup, String writeDate) {
		this.SNSNo = SNSNo;
		this.userNo = userNo;
		this.permission = permission;
		this.content = content;
		this.likely = likely;
		this.photoCount = photoCount;
		this.photoGroup = photoGroup;
		this.writeDate = writeDate;
	}
	public int getSNSNo() {
		return SNSNo;
	}
	public void setSNSNo(int SNSNo) {
		this.SNSNo = SNSNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public String getPhotoGroup() {
		return photoGroup;
	}
	public void setPhotoGroup(String photoGroup) {
		this.photoGroup = photoGroup;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWrite_Date(String writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
