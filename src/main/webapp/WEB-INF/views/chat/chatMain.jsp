<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${room.roomName }</title>
<style>
.chatting{
		width:500px;
}
.messageArea{
	overflow-y: auto;
	border : 1px solid black;
	height: 500px;
	display: flex;
	flex-direction: column;
	background-color : #b2c7d9; 
}
.messageArea>p{
	text-align: center;
	width: 100%;
}
#sendMsg{
	width:75%;
}
#sendBtn{
	width:20%;
}
.chat{
	margin-bottom: 10px;
	padding:8px;
	border-radius: 3px;
}
.chat:first-child{
	margin-top: 10px;
}
.left{
     position: relative;
     max-width: 300px;
     align-self: flex-start;
     background: #FFFFFF;
     -webkit-border-radius: 10px;
     -moz-border-radius: 10px;
     border-radius: 10px;
     margin-left:16px;
     padding:15px;
 }
  .left:after{
     content: '';
     position: absolute;
     border-style: solid;
     border-width: 15px 15px 15px 0;
     border-color: transparent #FFFFFF;
     display: block;
     width: 0;
     z-index: 1;
     left: -15px;
     top: 12px;
  }
.right{
      background-color: #ffeb33;
      max-width:300px;      
      align-self: flex-end;
      position: relative;      
      padding: 15px;      
      margin-right:16px;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
}
   .right:after{
      content: '';
      position: absolute;
      border-style: solid;
      border-width: 15px 0 15px 15px;
      border-color: transparent #ffeb33;
      display: block;
      width: 0;
      z-index: 1;
      right: -15px;
      top: 12px;
}
</style>
<!-- 부트스트랩 -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/bootstrap2.css" rel="stylesheet">
<!--기본 CSS-->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- jquery -->
<script src="/resources/js/jquery-3.6.0.js"></script>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/resources/js/chat/chatHeader.js"></script>
<script src="/resources/js/chat/alarm.js"></script>
<script>
//웹소켓 객체용 변수
let ws;
//접속회원 아이디용 변수
let memberNo;
//접속한 채팅방용 변수
let roomNo;
//아이디를 가져오는 변수
let memberId;
//채팅을 시작하는 함수
$(function(){		
	memberNo = '${sessionScope.m.memberNo }';
	roomNo = ${room.roomNo};
	memberId = $("#hiddenId").val();
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
		sendAlarm();
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
			
		}
	});
}

//	$(window).bind('beforeunload', function(){
//	    const data = {type:"exit",msg:memberNo,roomNo:roomNo,memberId:memberId};
//		ws.send(JSON.stringify(data));
//	});
</script>
</head>
<body>
	<input type="hidden" id="hiddenId" value="${sessionScope.m.memberId }">	
	<div class="chatting">
		<div class="messageArea">
			<c:forEach items="${chat }" var="ch" varStatus="i">
				<c:choose>
					<c:when test= "${ch.memberNo eq sessionScope.m.memberNo }">
						<div class='chat right'>${ch.chatContent }</div>
					</c:when>
					<c:otherwise>
						<div class='chat left'><span class='chatId'>${ch.memberId } : </span>${ch.chatContent }</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="sendBox">
			<input type="text" id="sendMsg">
			<button id="sendBtn" onclick="sendMsg();">전송</button>
		</div>
	</div>
</body>
</html>