package kr.co.cocean.personnel.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	

	@Bean
	public PasswordEncoder getPasswordEncoder() { // 암호화를 하기위한 빈 등록
		
		return new BCryptPasswordEncoder();
	}
	
	//Spring security 사용에 관련된 설정
	// 기능이 많이 있으므로 우리는 암호화만 사용 한다.
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.httpBasic().disable().csrf().disable(); // 로그인을 비롯한 기본 기능 사용 안함
		
		return http.build();
	}
}
