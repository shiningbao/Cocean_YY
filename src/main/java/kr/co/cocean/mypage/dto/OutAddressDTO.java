package kr.co.cocean.mypage.dto;

import org.apache.ibatis.type.Alias;

@Alias("addresss")
public class OutAddressDTO {
	
	//기본키 넣기
	private int addressNumber;
	private int employeeID;
	private String name;
	private String phoneNumber;
	private String positionLevel;
	private String rankLevel;
	private String departmentName;
	
	public int getAddressNumber() {
		return addressNumber;
	}
	public void setAddressNumber(int addressNumber) {
		this.addressNumber = addressNumber;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPositionLevel() {
		return positionLevel;
	}
	public void setPositionLevel(String positionLevel) {
		this.positionLevel = positionLevel;
	}
	public String getRankLevel() {
		return rankLevel;
	}
	public void setRankLevel(String rankLevel) {
		this.rankLevel = rankLevel;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	
	

}
