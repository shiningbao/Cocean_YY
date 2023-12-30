package kr.co.cocean.approval.dto;

import org.apache.ibatis.type.Alias;

@Alias("form")
public class formDTO {

	private String titleID;
	private String category;
	private String formTitle;
	
	public String getTitleID() {
		return titleID;
	}
	public void setTitleID(String titleID) {
		this.titleID = titleID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFormTitle() {
		return formTitle;
	}
	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}
}

