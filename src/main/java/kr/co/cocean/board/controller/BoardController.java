package kr.co.cocean.board.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.board.service.BoardService;
import kr.co.cocean.mypage.dto.LoginDTO;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@GetMapping(value = "/board/{boardTitle}/list")
	public String boardList(@PathVariable String boardTitle, Model model, HttpSession session) {
		
		String category = boardTitle;
		String bt = "";	
		switch (boardTitle) {
			case "notice":
				bt = "공지사항";
				break;
			case "anony":
				bt = "익명게시판";
				break;
			case "department":
				bt = "부서게시판";
				LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");			
				category = "DE"+userInfo.getDepartmentID();
				break;
			case "program":
				bt = "프로그램 일정";
				break;
		}
		
		logger.info("category : {}",category);
		
		model.addAttribute("bt", bt);
		model.addAttribute("list", service.boardList(category));
		model.addAttribute("list_pin", service.boardList_pin(category));
		
		return "board/boardList";
	}
	
	
	@GetMapping(value = "/board/{boardTitle}/write.go")
	public String boardWriteGo(@PathVariable String boardTitle, Model model) {
		
		String bt = "";	
		switch (boardTitle) {
			case "notice":
				bt = "공지사항";
				break;
			case "anony":
				bt = "익명게시판";
				break;
			case "department":
				bt = "부서게시판";
				//LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");			
				//category = "DE"+userInfo.getDepartmentID();
				break;
			case "program":
				bt = "프로그램 일정";
				break;
		}
		
		model.addAttribute("bt", bt);
		
		return "board/boardWrite";
	}
	
	@PostMapping(value = "/board/{boardTitle}/write.do")
	public String boardWriteDo(@PathVariable String boardTitle, @ModelAttribute BoardDTO param, Model model,HttpSession session, RedirectAttributes rAttr) {
		logger.info("boardTitle : {}",boardTitle);
//		logger.info("param title : {}",param.getTitle());
//		logger.info("param content : {}",param.getContent());
//		logger.info("param pin : {}",param.getIsPinned());
		
		String category = boardTitle;
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");			
		param.setEmployeeID(userInfo.getEmployeeID());

		switch (boardTitle) {
//		case "notice":
//			break;
		case "anony":
			param.setEmployeeID(999999);
			break;
		case "department":
			category = "DE"+userInfo.getDepartmentID();
			break;
//		case "program":
//			break;
	}
		param.setCategory(category);
		
		service.boardWrite(param);
		rAttr.addFlashAttribute("msg", "게시글을 등록했습니다.");
		
		return "redirect:/board/"+boardTitle+"/list";
	}
	
	
	@GetMapping(value = "/board/{boardTitle}/detail")
	public ModelAndView boardDetail(@PathVariable String boardTitle, @RequestParam int boardID, HttpSession session, Model model) {
		
		String category = boardTitle;
		String bt = "";
		switch (boardTitle) {
		case "notice":
			bt = "공지사항";
			break;
		case "anony":
			bt = "익명게시판";
			break;
		case "department":
			bt = "부서게시판";
			LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");	
			category = "DE"+userInfo.getDepartmentID();
			break;
		case "program":
			bt = "프로그램 일정";
			break;
		}
		
		return service.boardDetail(boardID,category,bt);
	}
	
	@PostMapping(value = "/board/{boardTitle}/commentWrite")
	@ResponseBody
	public HashMap<String, Object> commentWrite(@PathVariable String boardTitle, @ModelAttribute BoardDTO param) {
		
		switch (boardTitle) {
	//		case "notice":
	//			break;
			case "anony":
				param.setEmployeeID(999999);
				break;
			case "department":
	//			category = "DE"+userInfo.getDepartmentID();
				break;
	//		case "program":
	//			break;
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("newcomment", service.commentWrite(param));
		
		return result;
	}
	
	
	
	
	
	
	
	
}
