package kr.co.cocean.personnel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;

import kr.co.cocean.personnel.dao.PersonnelDAO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.TreeDTO;

@Service
public class PersonnelService {
	@Autowired PersonnelDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public int join(HashMap<String, Object> params) {
		String dpID = (String) params.get("departmentID");
		String rsID = (String) params.get("responsibility");
		logger.info("join 서비스접근 "+ params.get("employeeID"));
		logger.info("담당확인" + params.get("responsibility"));
		if(dpID.equals("사육팀") && rsID.equals("포유류")) {
			params.put("departmentID", 1);
		}else if(dpID.equals("사육팀") && rsID.equals("어류")) {
			params.put("departmentID", 2);
		}else if(dpID.equals("사육팀") && rsID.equals("기술지원")) {
			params.put("departmentID", 3);
		}else if(dpID.equals("질병관리팀") && rsID.equals("수의사")) {
			params.put("departmentID", 4);
		}else if(dpID.equals("질병관리팀") && rsID.equals("수산질병관리사")) {
			params.put("departmentID", 5);
		}else if(dpID.equals("교육전시팀") && rsID.equals("큐레이터")) {
			params.put("departmentID", 6);
		}else if(dpID.equals("교육전시팀") && rsID.equals("교육기획")) {
			params.put("departmentID", 7);
		}else if(dpID.equals("LSS팀") && rsID.equals("수조관리")) {
			params.put("departmentID", 8);
		}else if(dpID.equals("경영팀") && rsID.equals("시설관리")) {
			params.put("departmentID", 9);
		}else if(dpID.equals("경영팀") && rsID.equals("재무")) {
			params.put("departmentID", 10);
		}else if(dpID.equals("경영팀") && rsID.equals("인사")) {
			params.put("departmentID", 11);
		}else if(dpID.equals("마케팅팀") && rsID.equals("마케팅")) {
			params.put("departmentID", 12);
		}else if(dpID.equals("제주팀") && rsID.equals("임의담당")) {
			params.put("departmentID", 15);
		}else if(dpID.equals("제주2팀") && rsID.equals("임의담당1")) {
			params.put("departmentID", 16);
		}else if(dpID.equals("제주3팀") && rsID.equals("임의담당")) {
			params.put("departmentID", 17);
		}else if(dpID.equals("-가산") && rsID.equals("-")) {
			params.put("departmentID", 13);
		}else if(dpID.equals("-제주") && rsID.equals("-")) {
			params.put("departmentID", 14);
		}else if(dpID.equals("가산-사업본부장") && rsID.equals("-")) {
			params.put("departmentID", 18);
		}else if(dpID.equals("가산-경영본부장") && rsID.equals("-")) {
			params.put("departmentID", 19);
		}else if(dpID.equals("제주-사업본부장") && rsID.equals("-")) {
			params.put("departmentID", 20);
		}else if(dpID.equals("제주-경영본부장") && rsID.equals("-")) {
			params.put("departmentID", 21);
		}
		
		if(params.get("positionID").equals("2")) {
			params.put("responsibility", "-");
		}
		
		
		return dao.join(params);
	}
    public List<String> getBranch() {
        return dao.getBranch();
    }

	
	
	
	public List<String> getBranchID(String branchID) {
		// TODO Auto-generated method stub
		return dao.getBranchID(branchID);
	}
	public List<String> getHqID(String hqID) {
		return dao.getHqID(hqID);
	}
	public List<String> getDepartmentText(String departmentText) {
		return dao.getDepartmentText(departmentText);
	}
	public List<TreeDTO> getChart() {
		return dao.getChart();
	}
	public void joinTree(HashMap<String, Object> params) {
	    int departmentID = (int) params.get("departmentID");
	    String positionID = String.valueOf(params.get("positionID"));
	    
	    if (departmentID >= 1 && departmentID <= 3) {
	        params.put("departmentID", "1-h1-team1");
	    }else if(departmentID >= 4 && departmentID <= 5) {
	    	params.put("departmentID", "1-h1-team2");
	    }else if(departmentID >= 6 && departmentID <= 7) {
	    	params.put("departmentID", "1-h1-team3");
	    }else if(departmentID == 8) {
	    	params.put("departmentID", "1-h1-team4");
	    }else if(departmentID >= 9 && departmentID <= 11) {
	    	params.put("departmentID", "1-h1-team5");
	    }else if(departmentID == 12) {
	    	params.put("departmentID", "1-h2-team6");
	    }else if(departmentID == 13) {
	    	params.put("departmentID", "branch1");
	    }else if(departmentID == 14) {
	    	params.put("departmentID", "branch2");
	    }else if(departmentID == 15) {
	    	params.put("departmentID", "2-h1Jeju-team1");
	    }else if(departmentID == 16) {
	    	params.put("departmentID", "2-h1Jeju-team2");
	    }else if(departmentID == 17) {
	    	params.put("departmentID", "2-h1Jeju-team3");
	    }else if(departmentID == 18) {
	    	params.put("departmentID", "headquarters1");
	    }else if(departmentID == 19) {
	    	params.put("departmentID", "headquarters2");
	    }else if(departmentID == 20) {
	    	params.put("departmentID", "headquarters1Jeju");
	    }else if(departmentID == 21) {
	    	params.put("departmentID", "headquarters2Jeju");
	    }
	    if (positionID.equals("1")) {
	        params.put("positionID", "팀원");
	    } else if (positionID.equals("2")) {
	        params.put("positionID", "팀장");
	    } else if (positionID.equals("3")) {
	        params.put("positionID", "본부장");
	    } else if (positionID.equals("4")) {
	        params.put("positionID", "관장");
	    } else if (positionID.equals("5")) {
	        params.put("positionID", "대표이사");
	        params.put("departmentID", "#");
	    }
	    dao.joinTree(params);
	    logger.info("Tree구조확인 params" + params);
	}
	public List<HashMap<String, Object>> personnelList() {
		return dao.personnelList();
	}
	public List<HashMap<String, Object>> getSelectOptionBranch(String selectedBranchValue) {
		if(selectedBranchValue.equals("지점")) {
		}
		return dao.getSelectOptionBranch(selectedBranchValue);
	}

	public List<HashMap<String, Object>> searchPerson(String searchValue, String selectedOption) {
		// TODO Auto-generated method stub
		return dao.searchPerson(searchValue,selectedOption);
	}

	

}
