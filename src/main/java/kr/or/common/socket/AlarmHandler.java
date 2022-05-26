package kr.or.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.member.model.vo.Member;


public class AlarmHandler extends TextWebSocketHandler {
	//접속한 회원 세션을 저장하는 리스트(알림용)
	private List<WebSocketSession> sessionList;
	// 1:1 체팅용 채팅방 세션 생성
	private Map<String, WebSocketSession> memberList;	
	
	//생성자 생성
	public AlarmHandler() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<String, WebSocketSession>();
	}	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("접속세션 : "+session);
		//웹소켓 접속 시 접속 세션을 list에 추가
		sessionList.add(session);
		String senderId = currentUserName(session);
		System.out.println(senderId);
		if(senderId != null) {
			memberList.put(senderId, session);			
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		String msg = message.getPayload();
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
	}
	
	//session에 저장돼있는 member의 이름 가져오기
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("memberId");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getMemberId();
		return mid;
		
	}
}
