package kr.co.cocean.aquarium.dto;

import java.util.ArrayList;

public class InChargeChangeDTO {
	int animalID;
	ArrayList<Integer> inchargeList_before;
	ArrayList<Integer> inchargeList_after;
	
	public int getAnimalID() {
		return animalID;
	}
	public void setAnimalID(int animalID) {
		this.animalID = animalID;
	}
	public ArrayList<Integer> getInchargeList_before() {
		return inchargeList_before;
	}
	public void setInchargeList_before(ArrayList<Integer> inchargeList_before) {
		this.inchargeList_before = inchargeList_before;
	}
	public ArrayList<Integer> getInchargeList_after() {
		return inchargeList_after;
	}
	public void setInchargeList_after(ArrayList<Integer> inchargeList_after) {
		this.inchargeList_after = inchargeList_after;
	}
}
