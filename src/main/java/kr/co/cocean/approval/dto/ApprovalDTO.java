package kr.co.cocean.approval.dto;

import org.apache.ibatis.type.Alias;

@Alias("form")
public class ApprovalDTO {

	private int titleID;
	private String category;
	
	public int getTitleID() {
		return titleID;
	}
	public void setTitleID(int titleID) {
		this.titleID = titleID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
