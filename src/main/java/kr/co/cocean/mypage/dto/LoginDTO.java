package kr.co.cocean.mypage.dto;

import java.sql.Date;



public class LoginDTO {

	//사원(e)
	private int employeeID; //사번
	private String password; //비번
	private String name;//이름
	private String status;//상태
	private Date joinDate;//입사일
	private String phoneNumber; //전화번호
	private String address;//주소
	private int remainingAnnualLeave;// 잔여연차
	private int branchID;
	private String departmentName; // 부서명
	private String responName;
	private String serverFileName;
	private String positionName;
	private String rankName;
	
	

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
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}
	public String getResponName() {
		return responName;
	}
	public void setResponName(String responName) {
		this.responName = responName;
	}
	//부서 변경로그(d)
	private int departmentID; //부서
	private int rankID;//직급
	private int positionID;//직책




	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public int getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	public int getRankID() {
		return rankID;
	}
	public void setRankID(int rankID) {
		this.rankID = rankID;
	}
	public int getPositionID() {
		return positionID;
	}
	public void setPositionID(int positionID) {
		this.positionID = positionID;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
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
	public int getRemainingAnnualLeave() {
		return remainingAnnualLeave;
	}
	public void setRemainingAnnualLeave(int remainingAnnualLeave) {
		this.remainingAnnualLeave = remainingAnnualLeave;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}













}
