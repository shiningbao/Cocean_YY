package kr.co.cocean.tank.dto;

import org.apache.ibatis.type.Alias;

@Alias("Tank")
public class TankDTO {
	
	private int tankID;
	private String tankName;
	private String tankType;
	private String branchName;
	private String tankStatus;
	private String name;
	
	
	public int getTankID() {
		return tankID;
	}
	public void setTankID(int tankID) {
		this.tankID = tankID;
	}
	public String getTankName() {
		return tankName;
	}
	public void setTankName(String tankName) {
		this.tankName = tankName;
	}
	public String getTankType() {
		return tankType;
	}
	public void setTankType(String tankType) {
		this.tankType = tankType;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getTankStatus() {
		return tankStatus;
	}
	public void setTankStatus(String tankStatus) {
		this.tankStatus = tankStatus;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	

}
