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
	
	public void alarm(int employeeID, int historyID) {
		
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
		
		
		
	}

	
	
}
