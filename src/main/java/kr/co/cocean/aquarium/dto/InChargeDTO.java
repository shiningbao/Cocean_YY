package kr.co.cocean.aquarium.dto;

import org.apache.ibatis.type.Alias;

@Alias("incharge")
public class InChargeDTO {

	private int idx;
	private int employeeID;
	private String hqName;
	private String departmentName;
	private String name;


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getHqName() {
		return hqName;
	}
	public void setHqName(String hqName) {
		this.hqName = hqName;
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

}
