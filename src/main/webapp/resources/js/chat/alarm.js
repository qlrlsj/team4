	//웹소켓 객체용 변수
	let alarmWs;
	//접속회원 아이디용 변수
	let memberNo;
	//접속한 채팅방용 변수
	let roomNo;
	//아이디를 가져오는 변수
	let memberId;
	//채팅을 시작하는 함수
	function connenctAlarm{		
		 = ${sessionScope.m.memberNo };
		roomNo = ${room.roomNo};
		memberId = $("#hiddenId").val();
		console.log(memberNo);
		console.log(roomNo);
		console.log(memberId);
		//웹소켓 연결 시도
		ws = new WebSocket("ws://192.168.35.249/chat.kt");
		// 주소 바꿔줘야함
		//웹소켓 연결이 성공하면 실행할 함수 지정
		ws.onopen = startChat;
		//서버에서 화면으로 데이터를 전송하면 처리할 함수 지정
		ws.onmessage = receiveMsg;
		//웹소켓 연결이 종료되면 실행할 함수 지정
		ws.onclose = endChat;	
		
		$("#sendMsg").on("keyup",function(key){
			if(key.keyCode == 13){
				sendMsg();
			}
		});
		
		$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
	});
	function startChat(){
		//msg라는 키값으로 회원아이디를 웹소켓 서버로 전송
		const data = {type:"enter",msg:memberNo,roomNo:roomNo,memberId:memberId};
		ws.send(JSON.stringify(data));//data객체를 문자열로 변환해서 웹소켓 서버로 전송	
	}
	//사용자가 채팅을 보낼때
	function receiveMsg(param){
		appendChat(param.data);		
	}
	//채팅 팝업창 닫을 때
	function endChat(){
		console.log("웹소켓 종료")
	}
	//전송버튼 클릭 시 입력한 메세지를 전송하는 함수
	function sendMsg(){
		const msg = $("#sendMsg").val();
		chatInsert(msg);
		if(msg != ''){
			const data = {type:"chat",msg:msg,roomNo:roomNo,memberId:memberId};
			ws.send(JSON.stringify(data));
			appendChat("<div class='chat right'>"+msg+"</div>");
			$("#sendMsg").val("");
		}
	}
	//.messageArea에 메세지를 추가하는 함수
	function appendChat(msg){
		$(".messageArea").append(msg);
		$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
	}
	//채팅 db에 저장
	function chatInsert(msg){
		$.ajax({
			url : "/insertChat.kt",
			type: "post",
			data : {"chatContent":msg,"roomNo":roomNo,"memberNo":memberNo,"memberId":memberId},
			success : function(data) {
				console.log(data);
			}
		});
	}
	
// 	$(window).bind('beforeunload', function(){
// 	    const data = {type:"exit",msg:memberNo,roomNo:roomNo,memberId:memberId};
// 		ws.send(JSON.stringify(data));
// 	});