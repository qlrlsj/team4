package kr.or.common.socket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;




public class ChatHandler extends TextWebSocketHandler {
	//접속한 회원 세션을 저장하는 리스트(채팅용)
	private Map<String, WebSocketSession> sessionList;
	// 1:1 체팅용 채팅방 세션 생성
	private Map<Integer, Map<String,WebSocketSession>> roomMemberList;
	//생성자 생성
	public ChatHandler() {
		super();
		sessionList = new HashMap<String,WebSocketSession>();
		//roomNo를 키값으로 들어와있는 회원의 memberNo 와 session을 저장하는 Map
		roomMemberList = new HashMap<Integer, Map<String,WebSocketSession>>();
	}	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
//		System.out.println("메세지 전송한 세션 : "+session);
//		System.out.println("전송 메세지 : "+message.getPayload());
		//문자열을 Json 객체로 변환해줄 객체
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		//키가 type인 값을 추출
		String type = element.getAsJsonObject().get("type").getAsString();
		//타입에 맞는 메세지 출력
		String msg = element.getAsJsonObject().get("msg").getAsString();
		//방 번호 가져오기
		int roomNo = element.getAsJsonObject().get("roomNo").getAsInt();
		//멤버 아이디 가져오기
		String memberId = element.getAsJsonObject().get("memberId").getAsString();
		// 가져온 방 번호가 roomMemberList안에 키값으로 존재하지 않는다면 roomMemberList에 현제 roomNo를 키값으로 하나 넣어주기
		if(!roomMemberList.containsKey(roomNo)) {
			Map<String,WebSocketSession> newRoom = new HashMap<String,WebSocketSession>();
			roomMemberList.put(roomNo,newRoom);
		}
		Map<String,WebSocketSession> memberList = roomMemberList.get(roomNo);
		if(type.equals("chat")) {//채팅메세지를 입력한 경우
			String sendMsg = "<div class='chat left'><span class='chatId'>"+memberId+" : </span>"+msg+"</div>";
			for ( String key : memberList.keySet() ) {
			    if(!memberList.get(key).equals(session)) {
			    	TextMessage tm = new TextMessage(sendMsg);
			    	memberList.get(key).sendMessage(tm);
			    }
			}
		}else if(type.equals("enter")){
			//웹소켓 접속 시 접속 세션을 list에 추가
			if(!sessionList.containsKey(memberId)) {
				sessionList.put(memberId, session);			
			}
			memberList.put(msg, session);
			roomMemberList.put(roomNo,memberList);
		}
//		else if(type.equals("exit")) {
//			System.out.println("exit");			
//			if(memberList.size()==1) {
//				roomMemberList.remove(roomNo);
//			}else {
//				memberList.remove(msg);
//			}
//		}
	}
	//연결이 끊어진 뒤
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("out");
		//memberId기져오기
		String memberId = getMemberId(session);
		System.out.println(memberId);
		//채팅방 번호 가져오기
		int roomNo = getRoomNo(memberId);
		System.out.println(roomNo);
		//roomMemberList에 값을 가져올 Map 객체 생성
		Map<String, WebSocketSession> myMap = new HashMap<String, WebSocketSession>();
		//myMap 객체에 가져온 채팅방 번호를 키값으로하는 map 값 대입
		myMap = roomMemberList.get(roomNo);
		System.out.println(myMap);
		//연결이 끊어지는 시점에 myMap에 들어가있는 member가 1명과 같거가 보다 작으면 roomList에서 채팅방 세션삭제
		if(myMap.size()<=1) {
			roomMemberList.remove(roomNo);			
		}
	}
	// sessionList에 있는 memberId라는 키값을 가져오는 메소드
	public String getMemberId(WebSocketSession session) {
		 //value로 key 찾기        
		for (String key : sessionList.keySet()) {
            WebSocketSession value = sessionList.get(key);
            System.out.println("Iterating, key: " + key);

            if (value == session) {
                return key;
            }
        }
		return "test";		 
	}
	//session값이 속한 채팅방 번호를 가져오는 메소드
	public int getRoomNo(String memberId) {
		for(int key : roomMemberList.keySet()) {
			Map <String,WebSocketSession> forRoom = new HashMap<String, WebSocketSession>();
			forRoom = roomMemberList.get(key);
			if(forRoom.containsKey(memberId)) {
				return key;
			}			
		}
		return 1;
	}
	
}
