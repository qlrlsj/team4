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



public class ChatHandler extends TextWebSocketHandler {
	//접속한 회원 세션을 저장하는 리스트(채팅용)
	private List<WebSocketSession> sessionList;
	// 1:1 체팅용 채팅방 세션 생성
	private Map<WebSocketSession, String> memberList;	
	
	//생성자 생성
	public ChatHandler() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<WebSocketSession, String>();
	}	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("접속세션 : "+session);
		//웹소켓 접속 시 접속 세션을 list에 추가
		sessionList.add(session);

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		System.out.println("메세지 전송한 세션 : "+session);
		System.out.println("전송 메세지 : "+message.getPayload());
		//문자열을 Json 객체로 변환해줄 객체
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		//키가 type인 값을 추출
		String type = element.getAsJsonObject().get("type").getAsString();
		String msg = element.getAsJsonObject().get("msg").getAsString();
		if(type.equals("chat")) {//채팅메세지를 입력한 경우
			String sendMsg = "<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span>"+msg+"</div>";
			for(WebSocketSession s : sessionList) {
				if(!s.equals(session)) {
					//클라이언트 전송용 객체생성
					TextMessage tm = new TextMessage(sendMsg);
					//클라이언트에 전송
					s.sendMessage(tm);
				}
			}
		}
	}
}
