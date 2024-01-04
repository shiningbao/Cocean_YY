package kr.co.cocean.alarm.service;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.co.cocean.alarm.dao.SseDAO;

@Service
public class SseService {
	
	//@Autowired SseDAO dao;
	
	public static Map<Long, SseEmitter> sseEmitters = new ConcurrentHashMap<>();
	
	
	public SseEmitter subscribe(long ID) {
		
		SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);
		
		try {
			emitter.send(SseEmitter.event().name("connect"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		sseEmitters.put(ID, emitter);
		
		emitter.onCompletion(() -> sseEmitters.remove(ID));
		emitter.onTimeout(() -> sseEmitters.remove(ID));
		emitter.onError((e) -> sseEmitters.remove(ID));
		
		return emitter;
	}
	
	public void alarm(String category, int employeeID, int idx, String form) {
		
		long ID = employeeID;
		
		
		String content = "";
		
		
		switch (category) {
		case "결재대기":
			content = "<a herf=\"<c:url value='/approval/draftDetail.go?idx="+idx+"&employeeID="+employeeID+"&category=결재'/>\">"+form+" 결재해주세요.</a>";
			break;

		default:
			break;
		}
		
		if(sseEmitters.containsKey(ID)) {
			SseEmitter emitter = sseEmitters.get(ID);
			try {
				emitter.send(SseEmitter.event().name("alarm").data(content));
			} catch (IOException e) {
				e.printStackTrace();
				sseEmitters.remove(ID);
			}
		}
		
		/*
		각각의 서비스에서 알림종류, 콘텐츠, 알려줄 사원ID, idx 값을 보낸다
		컨텐츠는 업무기안서, 휴가신청서, 시설명, 하우스명 등
		
		db 인서트
		`
		sse send
		
		결재 대기 : (업무기안서)를 결재해주세요.
		http://localhost:8080/Cocean/approval/draftDetail.go?idx=134&employeeID={본인}&category=결재
		
		결재 완료 : (업무기안서)가 결재되었습니다
		http://localhost:8080/Cocean/approval/draftDetail.go?idx=56&employeeID={본인}
		
		예약 : (4446 소렌토) 예약 30분 전 입니다.
		http://localhost:8080/Cocean/schedule/schedule.go
		
		하우스 : (메인수조)에 문제가 생겼습니다.
		http://localhost:8080/Cocean/tank/detail.go?tankID=1
		*/
		
		
	}

	
	
}
