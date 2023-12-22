package kr.co.cocean.aquarium.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import kr.co.cocean.aquarium.dto.InChargeDTO;
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

	public ArrayList<String> tankList(String branch) {
		return dao.tankList(branch);
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
		
		if(con.equals("base")) {
			// 기본 정보
			model.addAttribute("base", dao.animalDetail(animalID));
			// 이미지
			model.addAttribute("image", dao.animalImage(animalID));
			// 담당자
			model.addAttribute("incharge", dao.animalInCharge(animalID));
		}else if(con.equals("log") || con.equals("plan")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String month = sdf.format(System.currentTimeMillis());
			model.addAttribute(con, dao.animalLogPlan(animalID, con,month));
			model.addAttribute("month", month);
		}
		
		return "aquarium/tab/tabList";
	}
	
	public String animalDetailAjax(int animalID, String con, String month, Model model) {
		if(con.equals("log") || con.equals("plan")) {
			model.addAttribute(con, dao.animalLogPlan(animalID, con,month));
			model.addAttribute("month", month);
		}
		return "aquarium/tab/tabList";
	}
	
	
	
	public AnimalDTO test() {
		
		return dao.animalDetail(8);
	}

	public void logplanWrite(LogPlanDTO param) {
		dao.logplanWrite(param);
		
	}


	
	
	
	
	
	
}
