package com.scmaster.vo;

public class BabyBook {
	private int boardnum;		
	private String userid;		
	private String title;		
	private String content;			
	private String regdate;
	private String originalfile;
	private String savedfile;
	
	public BabyBook() {
		super();
	}

	public BabyBook(int boardnum, String userid, String title, String content, String regdate, String originalfile,
			String savedfile) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.title = title;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "BabyBook [boardnum=" + boardnum + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}
	
	
}
