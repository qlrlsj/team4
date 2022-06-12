function openList() {
		  document.myChat.submit();
}

//화면 로딩 후 실행
//채팅을 시작하는 함수
function connenctAlarm(){		
// 	senderNo = ${sessionScope.m.memberNo };
	//웹소켓 연결 시도
	alarmWs = new WebSocket("ws://192.168.35.249//alarm.kt");
	// 주소 바꿔줘야함
	//웹소켓 연결이 성공하면 실행할 함수 지정
	alarmWs.onopen = startAlarm;
	//서버에서 화면으로 데이터를 전송하면 처리할 함수 지정
	alarmWs.onmessage = receiveAlarm;
	//웹소켓 연결이 종료되면 실행할 함수 지정
	alarmWs.onclose = endAlarm;	
}
function startAlarm(){
	//msg라는 키값으로 회원아이디를 웹소켓 서버로 전송
	const data = {type:"enter",memberNo:senderNo};
	alarmWs.send(JSON.stringify(data));//data객체를 문자열로 변환해서 웹소켓 서버로 전송	
}
//사용자가 데이터를 받을 때
function receiveAlarm(param){
	appendAlarm(param.data);	
}
//채팅 팝업창 닫을 때
function endAlarm(){
	console.log("웹소켓 종료");
}
//전송버튼 클릭 시 입력한 메세지를 전송하는 함수
function sendAlarm(msg){
	if(msg != ''){
		const data = {type:"chatSend",msg:msg,roomNo:roomNo,memberId:memberId};
		alarmWs.send(JSON.stringify(data));
	}
}
//.알람에 text를 추가하는 함수
function appendAlarm(msg){
	var count = $("#alarmCount").text();
	$(".alarm").empty();
	$(".alarm").append(msg);
	count = count+1;
	$("#alarmCount").empty();
	$("#alarmCount").append(count)
}
// count를 늘려주는 함수
function appendCount(msg){
	$("#alarmCount").empty();
	$("#alarmCount").append(msg);
}
