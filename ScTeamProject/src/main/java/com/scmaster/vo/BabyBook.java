package com.scmaster.vo;

public class BabyBook {
	private int boardnum;		
	private int userNo;	
	private int babyNo;				
	private String title;		
	private String content;			
	private String regdate;
	private String originalfile;
	private String savedfile;
	
	public BabyBook()
	{
		
	}
	
	public BabyBook(int boardnum, int userNo, int babyNo, String title, String content, String regdate,
			String originalfile, String savedfile) {
		this.boardnum = boardnum;
		this.userNo = userNo;
		this.babyNo = babyNo;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardNum) {
		this.boardnum = boardNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBabyNo() {
		return babyNo;
	}

	public void setBabyNo(int babyNo) {
		this.babyNo = babyNo;
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
		return "BabyBook [boardnum=" + boardnum + ", userNo=" + userNo + ", babyNo=" + babyNo + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", originalfile=" + originalfile + ", savedfile="
				+ savedfile + "]";
	}
<<<<<<< HEAD

	public int getBabyNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getTitle() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
=======
>>>>>>> parent of 90d42e1... Merge remote-tracking branch 'origin/leesa'
		
}
