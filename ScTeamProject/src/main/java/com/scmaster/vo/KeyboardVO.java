package com.scmaster.vo;

public class KeyboardVO
{
	private String type;
	
	public KeyboardVO() {
		this.type = "text";
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "KeyboardVO [type=" + type + "]";
	}

}
