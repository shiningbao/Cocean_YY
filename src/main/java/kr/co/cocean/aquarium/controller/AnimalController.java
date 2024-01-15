package kr.co.cocean.aquarium.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.AnimalListFilterDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;
import kr.co.cocean.aquarium.dto.InChargeChangeDTO;
import kr.co.cocean.aquarium.dto.LogPlanDTO;
import kr.co.cocean.aquarium.service.AnimalService;
import kr.co.cocean.mypage.dto.LoginDTO;

@Controller
public class AnimalController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired AnimalService service;

	/* 코션친구들 리스트 관련 */

	@GetMapping(value = "/animal/list.go")
	public ModelAndView animalListGo() {
		ModelAndView mav = new ModelAndView("aquarium/animalList");
		return mav;
	}

	@PostMapping(value = "/animal/list.do")
	public String animalListDO(@ModelAttribute("animalfilter") AnimalListFilterDTO param, Model model) {
		return service.animalList(param, model);
	}



/* 코션친구들 작성 관련 */

	@GetMapping(value = "/animal/write.go")
	public ModelAndView animalWriteGo(HttpSession session) {

		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int branchID = userInfo.getBranchID();

		ModelAndView mav = new ModelAndView("/aquarium/animalWrite");

		mav.addObject("tankList", service.tankList());
		return mav;
	}

	@PostMapping(value = "/animal/write.do")
	public ModelAndView animalWrite(MultipartFile[] files, AnimalDTO param, RedirectAttributes rAttr) {
		logger.info("files : {}",files);
		logger.info("param : {}",param);
		return service.animalWrite(files,param, rAttr);
	}

	@GetMapping(value ="/animal/classifi")
	public String getClassifi() {
		return "aquarium/classificationModal";
	}

// 작성 중 분류군 값 가져오기
	@GetMapping(value = "/animal/classficationSearch")
	@ResponseBody
	public HashMap<String, Object> search(@RequestParam String keyword) {
		HashMap<String, Object> result = new HashMap<>();

		ArrayList<ClassficationDTO> list = service.classficationSearch(keyword);
		result.put("list", list);
		return result;
	}

/* 코션친구들 수정 */
	@GetMapping(value = "/animal/update.go")
	public ModelAndView animalUpdateDo(@RequestParam int animalID) {
		return service.animalUpdateGo(animalID);
	}

	@PostMapping(value = "/animal/update.do")
	public String animalUpdate(MultipartFile[] files, AnimalDTO param, RedirectAttributes rAttr, HttpSession session) {
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		logger.info("tank name : {}",param.getTankName());

		service.animalUpdate(files,param,employeeID);

		String page = "redirect: detailBase?animalID="+param.getAnimalID();
		rAttr.addFlashAttribute("msg", "코션친구들을 수정했습니다.");

		return page;
	}

/* 코션친구들 삭제 */
	@GetMapping(value = "/animal/delete.do")
	public String animalDel(@RequestParam int animalID, Model model) {
		service.animalDel(animalID);
		model.addAttribute("msg", "코션친구를 삭제했습니다.");
		return "redirect: list.go";
	}

/* 코션친구들 상세보기 */
	@GetMapping(value = "/animal/detailBase")
	public ModelAndView animalDetailBase(@RequestParam int animalID) {
		return service.animalDetailBase(animalID);
	}

	@GetMapping(value = "/animal/detailLogPlan")
	public ModelAndView animalDetailBase(@RequestParam int animalID, @RequestParam String category, @RequestParam String month) {
		return service.animalDetailLogPlan(animalID, category, month);
	}

/* 기록 계획 관련 */
	@PostMapping(value = "/animal/logplanWrite.go")
	@ResponseBody
	public HashMap<String, Object> logplanWrite(LogPlanDTO param, HttpSession session) {
		logger.info("param.con : {}",param.getContent());

		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		param.setEmployeeID(employeeID);

		service.logplanWrite(param);
		HashMap<String, Object> result = new HashMap<>();
		result.put("con", param.getManageCategory());
		return result;
	}
	
	@PostMapping(value = "/animal/logplanUpdate.Do")
	@ResponseBody
	public HashMap<String, Object> logplanUpdateDo(@RequestParam int logID, @RequestParam String logplanUpdateContent){
		
		return service.logplanUpdateDo(logID,logplanUpdateContent);
	}
	
	
	
	@PostMapping(value = "/animal/logplanDel")
	@ResponseBody
	public HashMap<String, Object> logplanDel(@RequestParam int logID) {
		return service.logplanDel(logID);
	}

/* 담당자 변경 */
	@PostMapping(value = "/animal/inchargeChange")
	@ResponseBody
	public HashMap<String, Object> inchargeChange(
			@RequestBody InChargeChangeDTO dto) {
		return service.inchargeChange(dto);
	}

	@GetMapping(value = "/animal/organization")
	public String organization() {
		return "personnel/organization";
	}

	@PostMapping(value = "/animal/employeeInfo")
	@ResponseBody
	public HashMap<String, Object> employeeInfo(@RequestParam int employeeID) {
		return service.employeeInfo(employeeID);
	}
	
	
	@PostMapping(value = "/animal/logplanComplete")
	@ResponseBody
	public HashMap<String, Object> logplanComplete(@RequestParam int logID){
		return service.logplanComplete(logID);
	}
	
	
}
