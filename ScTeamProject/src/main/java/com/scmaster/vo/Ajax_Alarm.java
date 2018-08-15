package com.scmaster.vo;

import java.math.BigDecimal;

public class Ajax_Alarm {
	private Integer id;
	private String title;
	private String start;
	
	
	public Ajax_Alarm(BigDecimal id, String title, String start) {
		this.id = id.intValue();
		this.title = title;
		this.start = start;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "Ajax_Alarm [id=" + id + ", title=" + title + ", start=" + start + "]";
	}
	
	
}
