package kr.co.cocean.tank.dto;

import org.apache.ibatis.type.Alias;

@Alias("Pager")
public class Pager {

	

	private String search;
	private Integer startNum;
	private Integer pageNum;
	private Integer totalCount;
	private String category;
	private String status;
	private String type;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getPageNum() {
		if(this.pageNum==null || this.pageNum<1) {
			this.pageNum=1;
		}
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {

		this.pageNum = pageNum;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getStartNum() {
		return startNum;
		
	}
	public void setStartNum(Integer startNum) {
		if(this.startNum == null || this.startNum < 1) {
			this.startNum = 1;
		}
		this.startNum = startNum;
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
	
	
	public String getStatus() {
		if(this.status == null) {
			this.status = "";
		}
		return this.status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getType() {
		if(this.type == null) {
			this.type = "";
		}
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}



	
	
}
