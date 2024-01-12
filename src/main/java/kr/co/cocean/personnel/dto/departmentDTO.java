package kr.co.cocean.personnel.dto;



import org.apache.ibatis.type.Alias;
@Alias("department")
public class departmentDTO {
	private String departmentID;
	private String departmentName;
	private String hqID;
	private Boolean isActive;

	public String getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getHqID() {
		return hqID;
	}
	public void setHqID(String hqID) {
		this.hqID = hqID;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}






}
