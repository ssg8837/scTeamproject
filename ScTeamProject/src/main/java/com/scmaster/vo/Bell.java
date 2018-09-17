package com.scmaster.vo;

public class Bell {
	private int sender;//보낸사람
	private int receiver;//받은 사람
	private String str;//표시할 메세지
	private int type;//1=친구 요청
	
	public Bell(int sender, int receiver, String str,int type) {
		this.sender = sender;
		this.receiver = receiver;
		this.str = str;
		this.type =type;
	}
	
	
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
