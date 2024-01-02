package kr.co.cocean.tank.dto;

import org.apache.ibatis.type.Alias;

@Alias("Pager")
public class Pager {

	

	private String search;
	private Integer startNum;
	private Integer lastNum;
	private boolean lastCheck;
	
	
	
	


	public Integer getStartNum() {
		if(this.startNum == null || this.startNum < 1) {
			this.startNum = 1;
		}
		return startNum;
		
	}
	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	public Integer getLastNum() {
		return lastNum;
	}
	public void setLastNum(Integer lastNum) {
		this.lastNum = lastNum;
	}
	public boolean isLastCheck() {
		return lastCheck;
	}
	public void setLastCheck(boolean lastCheck) {
		this.lastCheck = lastCheck;
	}
	public String getSearch() {
			if(this.search == null) {
				this.search = "";
			}
		return this.search;
	}
	public void setSearch(String search) {
		this.search = search;
	}


	
	
}
