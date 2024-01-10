package kr.co.cocean.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterCeptorConfig implements WebMvcConfigurer{
	
	@Autowired LoginCheck check;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		// 인터셉터의 예외를 지정할 리스트
		List<String> excludeList = new ArrayList<String>();
		excludeList.add("/");
		excludeList.add("/resource/**");
		excludeList.add("/logingo");
		excludeList.add("/mypage/logout");
		excludeList.add("/logout");
		//excludeList.add("/**"); // 일반 모든 요청 예외로 설정
		
		
		registry.addInterceptor(check)		// 1. 인터셉터에 걸리면 실행할 클래스 추가
		.addPathPatterns("/**")					// 2. 인터셉터를 적용할 url 패턴 지정
		.excludePathPatterns(excludeList);	// 3. 인터셉터의 예외를 적용할 패턴 지정

	}
	
	
	
	
}
