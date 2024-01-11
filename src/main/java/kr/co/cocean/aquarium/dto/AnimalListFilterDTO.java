package kr.co.cocean.aquarium.dto;

import java.util.ArrayList;

import org.apache.ibatis.type.Alias;

@Alias("animalfilter")
public class AnimalListFilterDTO {

	private int inchargeEmployeeID;
	private String searchName;
	private ArrayList<String> statusValues;
	private ArrayList<String> classifiValues;


	public int getInchargeEmployeeID() {
		return inchargeEmployeeID;
	}
	public void setInchargeEmployeeID(int inchargeEmployeeID) {
		this.inchargeEmployeeID = inchargeEmployeeID;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public ArrayList<String> getStatusValues() {
		return statusValues;
	}
	public void setStatusValues(ArrayList<String> statusValues) {
		this.statusValues = statusValues;
	}
	public ArrayList<String> getClassifiValues() {
		return classifiValues;
	}
	public void setClassifiValues(ArrayList<String> classifiValues) {
		this.classifiValues = classifiValues;
	}



}
