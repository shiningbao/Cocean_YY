package kr.co.cocean.approval.dto;

import org.apache.ibatis.type.Alias;

@Alias("line")
public class LineDTO {

	 	private String approvalEmp;
	    private String order;
	    private String category;
	    private String employeeID;
	    private String approvalOrder;

	    public String getEmployeeID() {
			return employeeID;
		}
	    
		public void setEmployeeID(String employeeID) {
			this.employeeID = employeeID;
		}
		
		public String getApprovalOrder() {
			return approvalOrder;
		}
		
		public void setApprovalOrder(String approvalOrder) {
			this.approvalOrder = approvalOrder;
		}

		public String getApprovalEmp() {
			return approvalEmp;
		}

		public void setApprovalEmp(String approvalEmp) {
			this.approvalEmp = approvalEmp;
		}

		public String getOrder() {
	        return order;
	    }

	    public void setOrder(String order) {
	        this.order = order;
	    }

	    public String getCategory() {
	        return category;
	    }

	    public void setCategory(String category) {
	        this.category = category;
	    }

}

