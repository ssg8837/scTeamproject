package com.scmaster.vo;

import org.springframework.web.multipart.MultipartFile;

public class MultiFiles {

	private String title;
	private MultipartFile[] fileSet;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile[] getFileSet() {
		return fileSet;
	}
	public void setFileSet(MultipartFile[] fileSet) {
		this.fileSet = fileSet;
	}
	
	
}
