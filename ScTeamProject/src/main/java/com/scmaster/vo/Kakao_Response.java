package com.scmaster.vo;

public class Kakao_Response {
	private message message;
	

	public Kakao_Response(message message) {
		this.message = message;
	}

	public message getMessage() {
		return message;
	}

	public void setMessage(message message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Kakao_Response [message=" + message + "]";
	}
	


	
}
