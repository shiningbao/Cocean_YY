package kr.co.cocean.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.mypage.dto.LoginDTO;

@Service
public class ApprovalService {
	
	private String root = "C:/upload/cocean/";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public ArrayList<ApprovalDTO> list() {
		
		return dao.list();
	}

	public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr, List<String> keyword) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		
		if(dto!=null) {
			ArrayList<ApprovalDTO> list = dao.formSearch(keyword);
			mav.addObject("list",list);
			mav.setViewName("approval/formList");
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		return mav;
	}

	public ArrayList<ApprovalDTO> draftInfo(int employeeID) {
		return dao.draftInfo(employeeID);
	}

	public void write(MultipartFile[] files, HashMap<String, String> param) {
		ApprovalDTO dto = new ApprovalDTO();
		int employeeID = Integer.parseInt(param.get("employeeID"));
		int publicStatus = Integer.parseInt(param.get("publicStatus"));
		int tempSave = Integer.parseInt(param.get("tempSave"));
		String title = param.get("title");
		logger.info(title);
		dto.setEmployeeID(employeeID);
		dto.setPublicStatus(publicStatus);
		dto.setTempSave(tempSave);
		dto.setDocumentNo(title);
		
		dao.write(dto);
		int idx=dto.getIdx();
		for (MultipartFile file : files) {
			upload(file,idx);
		}
		dao.writeWorkDraft(param);
		// dao.writeAttendanceDraftContent(param);
		
	}
	
	public void upload(MultipartFile uploadFile, int idx) {
		
		String oriFileName = uploadFile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get(root+"draft/"+newFileName);
			String pathName = root+"draft/"+newFileName;
			Files.write(path, bytes);
			dao.writeFile(idx,oriFileName,newFileName,pathName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
