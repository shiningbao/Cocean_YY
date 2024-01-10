package kr.co.cocean.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;

@Component
public class LoginCheck implements HandlerInterceptor{
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	//Controller 접근 전에 오는 곳
	// 반환값이 false 면 컨트롤러 접근을 막는다.(하얀화면만 나오게됨)
	// 반환을 false 만 하면 안되고 response 를 이용해 redirect 시켜줘야 한다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//logger.info("######## PRE-HANDLER ########");
		boolean pass = true;
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
			pass = false;
			String ctx = request.getContextPath();
			//logger.info(ctx);
			response.sendRedirect(ctx);
		}
				
		return pass;
	}

	// Controller 에서 나온 후 오는 곳
	// ModelAndView 를 통해 원하는 값을 추가하여 보낼때 활용
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
//		logger.info("######## POST-HANDLER ########");
//		HttpSession session = request.getSession();
//		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
//		if(dto != null) {
//			String content = "<div>안녕하세요 "+dto.getName()+" 님, <a href='logout'>로그아웃</a></div>";	
//			mav.addObject("loginBox", content);
//		}	
	}

}
