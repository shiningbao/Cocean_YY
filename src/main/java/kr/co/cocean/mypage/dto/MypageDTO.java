package kr.co.cocean.mypage.dto;

import org.apache.ibatis.type.Alias;

@Alias("mypage")
public class MypageDTO {

	private int employeeID;
	private String name;
	private int rankID;
	private int departmentID;
	private int positionID;
	private String address;
	private String departmentName;
	private	String rankName;
	private String positionName;
	private String phoneNumber;
	private int remainingAnnualLeave;
	
	//file
	private int imageID;
	private String serverFileName;
	private String category;
	private String path;
	private int idx;
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRankID() {
		return rankID;
	}
	public void setRankID(int rankID) {
		this.rankID = rankID;
	}
	public int getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	public int getPositionID() {
		return positionID;
	}
	public void setPositionID(int positionID) {
		this.positionID = positionID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getRemainingAnnualLeave() {
		return remainingAnnualLeave;
	}
	public void setRemainingAnnualLeave(int remainingAnnualLeave) {
		this.remainingAnnualLeave = remainingAnnualLeave;
	}
	
	


	
	
	




	
}
