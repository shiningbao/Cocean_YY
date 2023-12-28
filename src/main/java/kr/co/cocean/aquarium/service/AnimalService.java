package kr.co.cocean.aquarium.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.aquarium.dao.AnimalDAO;
import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;
import kr.co.cocean.aquarium.dto.InChargeChangeDTO;
import kr.co.cocean.aquarium.dto.LogPlanDTO;
import kr.co.cocean.main.dto.FileDTO;

@Service
public class AnimalService {
	
	private String root = "C:/upload/cocean/";

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnimalDAO dao;

	public ArrayList<AnimalDTO> animalList() {
		return dao.animalList();
	}

	public ArrayList<ClassficationDTO> classficationSearch(String keyword) {
		
		return dao.classficationSearch(keyword);
	}

	public ArrayList<HashMap<String, String>> tankList(int branchID) {
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
		mav.setViewName("redirect:/animal/list.go");
		rAttr.addFlashAttribute("msg", "코션친구를 등록했습니다.");
		
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
			model.addAttribute(con, dao.animalLogPlan(animalID, con,month));
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
/*
	public HashMap<String, Object> inchargeChange(Map<String, Object> param) {
		
		int animalID = (int) param.get("animalID");

		int[] inchargeList_before = (int[]) param.get("inchargeList_before");
		int[] inchargeList_after = (int[]) param.get("inchargeList_after");
			
		ArrayList<Integer> before = new ArrayList<Integer>();
		ArrayList<Integer> after = new ArrayList<Integer>();
		
		ArrayList<Integer> delList = new ArrayList<Integer>();
		ArrayList<Integer> insertList = new ArrayList<Integer>();
		
		for (int i : inchargeList_before) {
			before.add(i);
		}
		
		for (int i : inchargeList_after) {
			after.add(i);
		}
		
		for (Integer integer : before) {
			if(!after.contains(integer)) {
				delList.add(integer);
			}
		}
		
		for (Integer integer : after) {
			if(!before.contains(integer)) {
				insertList.add(integer);
			}
		}
		
		dao.inchargeDel(animalID,delList);
		dao.inchargeInsert(animalID,insertList);
		
		
		return null;
	}
*/
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


	
	
	
	
	
	
}
