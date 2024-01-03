package kr.co.cocean.alarm.service;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Service
public class SseService {
	
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
	
	public void alarm(int employeeID, String category, int idx) {
		
		long ID = employeeID;
		
		String msg = "good";
		
		if(sseEmitters.containsKey(ID)) {
			SseEmitter emitter = sseEmitters.get(ID);
			try {
				emitter.send(SseEmitter.event().name("alarm").data(msg));
			} catch (IOException e) {
				e.printStackTrace();
				sseEmitters.remove(ID);
			}
		}
		
		/*
		각각의 서비스에서 알림종류, 콘텐츠, 알려줄 사원ID, idx 값을 보낸다
		컨텐츠는 업무기안서, 휴가신청서, 시설명 등
		
		db 인서트
		
		sse send
		
		결재 대기 : (업무기안서)를 결재해주세요.
		
		결재 완료 : (업무기안서)가 결재되었습니다
		
		예약 : (4446 소렌토) 예약 30분 전 입니다.
		
		*/
		
		
	}

	
	
}
