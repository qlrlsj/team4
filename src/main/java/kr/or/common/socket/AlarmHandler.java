package kr.or.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Alarm;
import kr.or.member.model.vo.Member;


public class AlarmHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService chatService;
	//접속한 회원 세션을 저장하는 리스트(알림용)
	private Map<Integer, WebSocketSession> sessionList;	
	
	//생성자 생성
	public AlarmHandler() {
		super();
		sessionList = new HashMap<Integer, WebSocketSession>();
	}	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		JsonParser parser = new JsonParser();
		//getPatload = 받아온 데이터를 키값:값 으로 주는 메소드
		JsonElement element = parser.parse(message.getPayload());
		//전송데이터 구분을위한 값인 type값 확인
		String type = element.getAsJsonObject().get("type").getAsString();
		if(type.equals("enter")) {
			int memberNo = element.getAsJsonObject().get("memberNo").getAsInt();
			System.out.println("senderNo받고");
			sessionList.put(memberNo, session);
			System.out.println("enter");
		}else if(type.equals("chatSend")) {
			int roomNo = element.getAsJsonObject().get("roomNo").getAsInt();
			int senderNo = element.getAsJsonObject().get("senderNo").getAsInt();
			int receiverNo = element.getAsJsonObject().get("receiverNo").getAsInt();
			String sendContent = element.getAsJsonObject().get("sendContent").getAsString();
			Alarm am = new Alarm();
			am.setRoomNo(roomNo);
			am.setSenderNo(senderNo);
			am.setReceiverNo(receiverNo);
			am.setSendContent(sendContent);
			int result = chatService.insertDm(am);
			if(result != -1) {
				WebSocketSession receiverSession = sessionList.get(receiverNo);
				if(receiverSession!=null) {
					TextMessage tm = new TextMessage("<span id='senderNo'>"+senderNo+"</span><hr>"+"<span id='sendContent'>"+sendContent+"</span>");
					receiverSession.sendMessage(tm);					
				}				
			}
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		int currentNo = getMemberNo(session);
		sessionList.remove(currentNo);
	}
	//세션의 memberNo를 찾아주는 메소드
	public int getMemberNo(WebSocketSession session) {
		 //value로 key 찾기        
		for (int key : sessionList.keySet()) {
           WebSocketSession value = sessionList.get(key);
           System.out.println("Iterating, key: " + key);
           if (value == session) {
               return key;
           }
       }
		return 1;		 
	}
	
	
	
}
