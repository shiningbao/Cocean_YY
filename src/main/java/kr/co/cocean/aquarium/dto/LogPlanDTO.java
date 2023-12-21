package kr.co.cocean.aquarium.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("logplan")
public class LogPlanDTO {

	private int logID;
	private int employeeID;
	private String manageCategory;
	private String coceanCategory;
	private Date idx;
	private int creationDate;
	private String content;
	private String status;
	
	
	public int getLogID() {
		return logID;
	}
	public void setLogID(int logID) {
		this.logID = logID;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getManageCategory() {
		return manageCategory;
	}
	public void setManageCategory(String manageCategory) {
		this.manageCategory = manageCategory;
	}
	public String getCoceanCategory() {
		return coceanCategory;
	}
	public void setCoceanCategory(String coceanCategory) {
		this.coceanCategory = coceanCategory;
	}
	public Date getIdx() {
		return idx;
	}
	public void setIdx(Date idx) {
		this.idx = idx;
	}
	public int getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(int creationDate) {
		this.creationDate = creationDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
