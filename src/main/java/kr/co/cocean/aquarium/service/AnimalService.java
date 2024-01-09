package kr.co.cocean.aquarium.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.alarm.service.AlarmService;
import kr.co.cocean.alarm.service.SseService;
import kr.co.cocean.aquarium.dao.AnimalDAO;
import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.AnimalListFilterDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;
import kr.co.cocean.aquarium.dto.InChargeChangeDTO;
import kr.co.cocean.aquarium.dto.LogPlanDTO;
import kr.co.cocean.main.dto.FileDTO;

@Service
public class AnimalService {
	
	private String root = "C:/upload/cocean/";

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnimalDAO dao;

	public String animalList(AnimalListFilterDTO param, Model model) {
		
		logger.info("emp : {}",param.getInchargeEmployeeID());
		
		ArrayList<AnimalDTO> list = dao.animalList(param);
		
		model.addAttribute("list", list);
		
		return "aquarium/animalView";
	}

	public ArrayList<ClassficationDTO> classficationSearch(String keyword) {
		
		return dao.classficationSearch(keyword);
	}

	public ArrayList<AnimalDTO> tankList(int branchID) {
		return dao.tankList(branchID);
	}
	
	
	public ModelAndView animalWrite(MultipartFile[] files, AnimalDTO param, RedirectAttributes rAttr ) {
		// 코션친구들 등록
		dao.animalWrte(param);
		int animalID = param.getAnimalID();
		// 업로드

		for (MultipartFile uploadfile : files) {
			upload(uploadfile, animalID);
		}

		
		ModelAndView mav = new ModelAndView();
		rAttr.addFlashAttribute("msg", "코션친구를 등록했습니다.");
		mav.setViewName("redirect:/animal/list.go");
		
		return mav;
	}
	
	// 첨부파일 DB등록 및 서버 저장
	public void upload(MultipartFile uploadfile, int animalID) {
		
		FileDTO dto = new FileDTO();
		
		String oriFileName = uploadfile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		
		dto.setCategory("코션친구들");
		dto.setIdx(animalID);
		dto.setPath("animal");
		dto.setServerFileName(newFileName);
		dto.setOriFileName(oriFileName);
		
		dao.upload(dto);
		
		try {
			byte[] bytes = uploadfile.getBytes();
			Path path = Paths.get(root+"animal/"+newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ModelAndView animalDetailBase(int animalID) {
		ModelAndView mav = new ModelAndView("aquarium/animalDetail_base");
		mav.addObject("base", dao.animalDetail(animalID));
		mav.addObject("image", dao.animalImage(animalID));
		mav.addObject("incharge", dao.animalInCharge(animalID));	
		mav.addObject("title", dao.getAnimalTitle(animalID));
		return mav;
	}
	
	public ModelAndView animalDetailLogPlan(int animalID, String category, String month) {
		ModelAndView mav = new ModelAndView("aquarium/animalDetail_log");
		
		mav.addObject("category", category);
		mav.addObject("content", dao.animalLogPlan(animalID, category, month));
		mav.addObject("month",month);
		mav.addObject("animalID", animalID);
		mav.addObject("title", dao.getAnimalTitle(animalID));
		
		return mav;
	}
	
	public String animalDetailAjax(int animalID, String con, Model model) {
		String page = "aquarium/animalDetail_"+con;
		if(con.equals("base")) {
			// 기본 정보
			model.addAttribute("base", dao.animalDetail(animalID));
			// 이미지
			model.addAttribute("image", dao.animalImage(animalID));
			// 담당자
			model.addAttribute("incharge", dao.animalInCharge(animalID));
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String month = sdf.format(System.currentTimeMillis());
			model.addAttribute("category", con);
			model.addAttribute("content", dao.animalLogPlan(animalID, con,month));
			model.addAttribute("month", month);
		}
		
		return page;
	}
	
	public String animalDetailAjax(int animalID, String con, String month, Model model) {
		String page = "aquarium/animalDetail_"+con;
		
		model.addAttribute(con, dao.animalLogPlan(animalID, con,month));
		model.addAttribute("month", month);
		
		return page;
	}

	public void logplanWrite(LogPlanDTO param) {
		dao.logplanWrite(param);
		
		int animalID = param.getIdx();
		String status = param.getStatus();
		dao.statusChange(animalID, status);
		
		dao.testalarm(1,"/animal/detail.go?animalID=1","코션친구들 로그 작성 됨");
		SseService sse = new SseService();
		sse.alarm(1, "코션친구들 로그 작성 됨", "/animal/detail.go?animalID=1");
		
		
	}

	public HashMap<String, Object> employeeInfo(int employeeID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		HashMap<String, String> info = dao.employeeInfo(employeeID);
		logger.info("info : {}",info);
		if(info != null) {
			String departnemtname = info.get("departmentName");
			if(departnemtname.equals("사육팀") || departnemtname.equals("질병관리팀")) {
				result.put("info", info);			
			}else {
				result.put("msg","사육팀 또는 질병관리팀만 선택할 수 있습니다.");
			}
			
		}else {
			result.put("msg", "직원 정보를 확인할 수 없습니다.");
		}
		
		return result;
	}

	public HashMap<String, Object> inchargeChange(InChargeChangeDTO dto) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		int animalID = dto.getAnimalID();
		
		ArrayList<Integer> inchargeList_before = dto.getInchargeList_before();
		ArrayList<Integer> inchargeList_after = dto.getInchargeList_after();	
		
		ArrayList<Integer> delList = new ArrayList<Integer>();
		ArrayList<Integer> insertList = new ArrayList<Integer>();
		
		for (Integer integer : inchargeList_before) {
			if(!inchargeList_after.contains(integer)) {
				delList.add(integer);
			}
		}
		
		for (Integer integer : inchargeList_after) {
			if(!inchargeList_before.contains(integer)) {
				insertList.add(integer);
			}
		}
		
		// int aa = Integer.parseInt(animalID);
		if(delList.size() > 0) {
			logger.info("delList : {}",delList);
			dao.inchargeDel(animalID,delList);			
		}
		if(insertList.size() > 0) {
			logger.info("insertList : {}",insertList);
			dao.inchargeInsert(animalID,insertList);		
		}
		
		result.put("msg", "담당자를 변경하였습니다.");
		
		return result;
	}

	public HashMap<String, Object> logplanDel(int logID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int cnt = dao.logplanDel(logID);
		logger.info("cnt : {}",cnt);
		String msg = "asf";
		if(cnt == 1) {
			msg = "삭제했습니다.";
		}
		result.put("msg", msg);
		return result;
	}

	public ModelAndView animalUpdateGo(int animalID) {
		ModelAndView mav = new ModelAndView("/aquarium/animalUpdate");
		
		AnimalDTO content = dao.animalDetail(animalID);
		
		mav.addObject("content", content);
		mav.addObject("tankList", dao.tankList(content.getBranchID()));
		return mav;
	}

	public void animalUpdate(MultipartFile[] files, AnimalDTO param, int employeeID) {
		
		logger.info("t id : {}",param.getTankID());
		logger.info("t na : {}",param.getTankName());
		
		AnimalDTO ori = dao.animalDetail(param.getAnimalID());
		
		String change = equalsAnimalDTO(ori, param);
		if(!change.equals("")) {
			String log = "<p>코션 친구들구 변경 사항</p>"+change;
			dao.animalUpdate(param);
			
			LogPlanDTO dto = new LogPlanDTO();
			dto.setEmployeeID(employeeID);
			dto.setManageCategory("log");
			dto.setCoceanCategory("animal");
			dto.setIdx(param.getAnimalID());
			dto.setContent(log);
			dto.setStatus(param.getStatus());
			
			dao.logplanWrite(dto);
		}
		

	}

	private String equalsAnimalDTO(AnimalDTO ori, AnimalDTO param) {
		String log = "";
		if(!Objects.equals(ori.getTankID(),param.getTankID())){
			log += "<p>코션하우스 변경 : "+ori.getTankName()+" -> "+param.getTankName()+"</p>";
		}
		if(!Objects.equals(ori.getNickname(),param.getNickname())){
			log += "<p>애칭 변경 : "+ori.getNickname()+" -> "+param.getNickname()+"</p>";
		}
		if(!Objects.equals(ori.getIndividual(),param.getIndividual())){
			log += "<p>개체수 변경 : "+ori.getIndividual()+" -> "+param.getIndividual()+"</p>";
		}
		if(!Objects.equals(ori.getBirthDate(),param.getBirthDate())){
			log += "<p>태어난 날 변경 : "+ori.getBirthDate()+" -> "+param.getBirthDate()+"</p>";
		}
		if(!Objects.equals(ori.getEntryDate(),param.getEntryDate())){
			log += "<p>들어온 날 변경 : "+ori.getEntryDate()+" -> "+param.getEntryDate()+"</p>";
		}
		if(!Objects.equals(ori.getStatus(),param.getStatus())){
			log += "<p>상태 변경 : "+ori.getStatus()+" -> "+param.getStatus()+"</p>";
		}
		if(!Objects.equals(ori.getDetails(),param.getDetails())){
			log += "<p>세부정보 변경 : "+ori.getDetails()+" -> "+param.getDetails()+"</p>";
		}
		
		return log;
	}

	public void animalDel(int animalID) {
		dao.animalDel(animalID);
		
	}


	


	
	
	
	
	
	
}
