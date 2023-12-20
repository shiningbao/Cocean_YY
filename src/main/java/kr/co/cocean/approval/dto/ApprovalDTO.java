package kr.co.cocean.approval.dto;

import org.apache.ibatis.type.Alias;

@Alias("form")
public class ApprovalDTO {

	private String titleID;
	private String category;
	private String title;
	private int employeeID;
	
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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
}

