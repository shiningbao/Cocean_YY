package kr.co.cocean.mypage.dto;

import java.sql.Date;
import java.sql.Timestamp;



public class LoginDTO {

	//사원(e)
	private int employeleeID; //사번
	private String password; //비번
	private String name;//이름
	private String status;//상태
	private Date joinDate;//입사일
	private String phoneNumber; //전화번호
	private String address;//주소
	private int remainingAnnualLeaver;// 잔여연차	
	
	//부서 변경로그(d)
	private String departmentName; //부서 
	private String rankLevel;//직급
	private String positionLevel;//직책
	
	
	public int getEmployeleeID() {
		return employeleeID;
	}
	public void setEmployeleeID(int employeleeID) {
		this.employeleeID = employeleeID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRemainingAnnualLeaver() {
		return remainingAnnualLeaver;
	}
	public void setRemainingAnnualLeaver(int remainingAnnualLeaver) {
		this.remainingAnnualLeaver = remainingAnnualLeaver;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRankLevel() {
		return rankLevel;
	}
	public void setRankLevel(String rankLevel) {
		this.rankLevel = rankLevel;
	}
	public String getPositionLevel() {
		return positionLevel;
	}
	public void setPositionLevel(String positionLevel) {
		this.positionLevel = positionLevel;
	}
	
	
	
	
	
	


	
	
	
	
	
}
