package kr.co.cocean.approval.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("form")
public class ApprovalDTO {

	private String titleID;
	private String category;
	private String title;
	private String name;
	private String departmentName;
	private Date workDate;
	private String rankName;
	
	
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
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

