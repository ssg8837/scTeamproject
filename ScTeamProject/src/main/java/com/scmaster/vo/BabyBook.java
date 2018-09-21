package com.scmaster.vo;

public class BabyBook {
	private int boardnum;		
	private int userNo;			
	private String content;			
	private String regdate;
	private String originalfile;
	private String savedfile;
	
	public BabyBook() {
		super();
	}

	public BabyBook(int boardnum, int userNo, String content, String regdate, String originalfile, String savedfile) {
		super();
		this.boardnum = boardnum;
		this.userNo = userNo;
		this.content = content;
		this.regdate = regdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	@Override
	public String toString() {
		return "BabyBook [boardnum=" + boardnum + ", userNo=" + userNo + ", content=" + content + ", regdate=" + regdate
				+ ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}

	public int getBabyNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getTitle() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
		
}
