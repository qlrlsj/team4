<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/bootstrap2.css" rel="stylesheet">
<!--기본 CSS-->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- jquery -->
<script src="/resources/js/jquery-3.6.0.js"></script>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- datePicker -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/datepicker.css">
<!-- 썸머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<!--파일 업로드 css-->
<link rel="stylesheet" href="/resources/css/file.css">
<!-- 채팅 리스트 js -->
<link rel="stylesheet" href="/resources/css/chat/chatHeader.css">
<script src="/resources/js/chat/chatHeader.js"></script>
<title>Insert title here</title>
<style>
.alarm{
	display : none;
}
</style>
<script>
$(function(){
	var loginCheck = ${login};
	console.log(loginCheck);
	if(loginCheck == true){
		connenctAlarm();
	}
});
//웹소켓 객체용 변수
let alarmWs;
//접속회원 아이디용 변수
let senderNo;
//접속한 채팅방용 변수
let roomNo;
//아이디를 가져오는 변수
// const memberId = ${sessionScope.m.memberNo };
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
	const data = {type:"enter",senderNo:senderNo};
	ws.send(JSON.stringify(data));//data객체를 문자열로 변환해서 웹소켓 서버로 전송	
}
//사용자가 채팅을 보낼때
function receiveAlarm(param){
	if(Number.isInteger(param.data)){
		appendCount(param.data);
	}else{
		appendAlarm(param.data);		
	}
	
}
//채팅 팝업창 닫을 때
function endAlarm(){
	console.log("웹소켓 종료");
}
//전송버튼 클릭 시 입력한 메세지를 전송하는 함수
function sendAlarm(){
	const msg = $("#sendMsg").val();
	chatInsert(msg);
	if(msg != ''){
		const data = {type:"chatSend",msg:msg,roomNo:roomNo,memberId:memberId};
		ws.send(JSON.stringify(data));
		appendChat("<div class='chat right'>"+msg+"</div>");
		$("#sendMsg").val("");
	}
}
//.알람에 text를 추가하는 함수
function appendAlarm(msg){
	$(".alarm").empty();
	$(".alarm").append(msg);
}
// count를 늘려주는 함수
function appendCount(msg){
	$("#alarmCount").empty();
	$("#alarmCount").append(msg);
}
//채팅 db에 저장
function alarmInsert(msg){
	$.ajax({
		url : "/insertAlarm.kt",
		type: "post",
		data : {"alarmContent":msg,"roomNo":roomNo,"senderNo":memberNo,"receiverId":memberId},
		success : function(data) {
			console.log(data);
		}
	});
}
</script>
</head>
<body>
	<header class="p-3 border-bottom">
	<div class="alarm">
		<span id="senderNo">senderNo</span><hr>
		<span id="sendContent">안녕하세요</span>
		<span>${loginMessage }</span>
		<span>${sessionScope.m.memberId }</span>
		<span>${mem11.memberId }</span>
	</div>
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<img src="/resources/img/logo.png" height="100px">
				</a>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 ms-lg-5" style="width:27%;">
					<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
				</form>
				<c:choose>
					<c:when test="${empty sessionScope.m }">
						<ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
							<li><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button></li>
							<li><a href="/joinFrm.kt" class="nav-link px-2 link-dark">회원가입</a></li>
						</ul>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="/login.kt" method="post">
										<div class="modal-body">
											<fieldset>
												<legend>로그인</legend>
												아이디:<input type="text" name="memberId"><br>
												비번:<input type="password" name="memberPw"><br>	
											</fieldset>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">로그인</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="grade" value="${sessionScope.m.memberGrade }"/> <!-- 관리자로 로그인 했을 때, 회원관리 버튼 보이도록 -->
						<c:choose>
							<c:when test="${grade eq '0' }"><!-- <!-- 관리자 로그인 -->
								<ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
								<li><a href="#" class="nav-link px-2 link-dark">위시리스트</a></li>
								<li><a href="#" class="nav-link px-2 link-dark">내 여행</a></li>
								<li><a href="/questionList.kt?reqPage=1" class="nav-link px-2 link-dark">문의하기</a></li>
								<li><a href="/allMember.kt?reqPage=1" class="nav-link px-2 link-dark">회원관리</a></li><!-- 관리자만 보이는 버튼 -->
								<li><span class="material-symbols-outlined bell">notifications</span><span id="alarmCount"></span></li>
							</ul>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton2" data-bs-toggle="dropdown"
										aria-expanded="false">내정보</button>
									<ul class="dropdown-menu dropdown-menu-dark"
										aria-labelledby="dropdownMenuButton2">
										<li><a class="dropdown-item active" href="#">포인트</a></li>
										<li><a class="dropdown-item" href="#">쿠폰</a></li>
										<li><a class="dropdown-item" href="#">파트너 등록하기</a></li>
										<li><a class="dropdown-item" href="/mypage.kt">마이페이지</a></li>
										<li><a class="dropdown-item" href="/sellerPage.kt">판매자 페이지</a></li>		
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/logout.kt">로그아웃 </a></li>
									</ul>
								</div>
							</c:when>
							<c:otherwise> <!-- 판매자,구매자 로그인 -->
								<ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
								<li><a href="#" class="nav-link px-2 link-dark">위시리스트</a></li>
								<li><a href="#" class="nav-link px-2 link-dark">내 여행</a></li>
								<li><a href="/questionList.kt?reqPage=1" class="nav-link px-2 link-dark">문의하기</a></li>
								<li><span class="material-symbols-outlined bell">notifications</span><span id="alarmCount"></span></li>
							</ul>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton2" data-bs-toggle="dropdown"
										aria-expanded="false">내정보</button>
									<ul class="dropdown-menu dropdown-menu-dark"
										aria-labelledby="dropdownMenuButton2">
										<li><a class="dropdown-item active" href="#">포인트</a></li>
										<li><a class="dropdown-item" href="#">쿠폰</a></li>
										<li><a class="dropdown-item" href="#">파트너 등록하기</a></li>
										<li><a class="dropdown-item" href="/mypage.kt">마이페이지</a></li>	
										<c:if test="${grade eq '1' }">
											<li><a class="dropdown-item" href="/sellerPage.kt">판매자 페이지</a></li>										
										</c:if>
										<li>
											<a class="dropdown-item" href="#" onclick="openList();">내 채팅</a>
											<form name="myChat" action="/chatList.kt" method="post">
												<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
											</form>
										</li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/logout.kt">로그아웃 </a></li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
						
						
							
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="Tenth navbar example">
		<div class="container-fluid">
			<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"	href="/selectAllAir.kt">항공편</a></li>
					<li class="nav-item"><a class="nav-link active" href="/hostelMain.kt">숙소</a></li>
					<li class="nav-item"><a class="nav-link active" href="/ticketMain.kt">티켓</a></li>
					<li class="nav-item"><a class="nav-link active" href="/packageMain.kt">패키지</a></li>
					<li class="nav-item"><a class="nav-link active" href="/companionMain.kt?reqPage=1">동행자 모집</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>