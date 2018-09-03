package com.scmaster.vo;

public class message {
	private String text;

	public message(String text) {
		this.text = text;
	}

	public String getMessage() {
		return text;
	}

	public void setMessage(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return " [text=" + text + "]";
	}
	
}
