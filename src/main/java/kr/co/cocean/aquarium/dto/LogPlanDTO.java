package kr.co.cocean.aquarium.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("logplan")
public class LogPlanDTO {

	private int logID;
	private String departmentName;
	private String name;
	private int employeeID;
	private String manageCategory;
	private String coceanCategory;
	private int idx;
	private Date creationDate;
	private String content;
	private String status;
	
	
	public int getLogID() {
		return logID;
	}
	public void setLogID(int logID) {
		this.logID = logID;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
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
