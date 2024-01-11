package kr.co.cocean.personnel.dto;



import org.apache.ibatis.type.Alias;
@Alias("annual")
public class annualDTO {

	private String year;
	private int value;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}




}
