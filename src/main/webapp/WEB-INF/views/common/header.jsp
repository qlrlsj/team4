<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 구글 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- datePicker -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/datepicker.css">
<!-- 썸머노트 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<!--파일 업로드 css-->
<link rel="stylesheet" href="/resources/css/file.css">
<!-- 채팅 리스트 js -->
<link rel="stylesheet" href="/resources/css/chat/chatHeader.css">
<!--티켓등록폼 css-->
<link rel="stylesheet" href="/resources/css/ticket/insertTicketForm.css">
<script src="/resources/js/chat/chatHeader.js"></script>
<title>Insert title here</title>
<style>
.alarm {
	display: none;
}

.navbarsExample08 {
	min-width: 500px;
	min-height: 50px;
}

.headerNav {
	width: 100%;
	min-width: 300px;
}

.headerDiv {
	margin-left: 10%;
	width: 80%;
	padding: 0;
}

.headerUi {
	width: 100%;
	min-height: 40px;
	min-width: 200px;
	padding: 0;
}

.headerLi {
	width: 20%;
	min-height: 40px;
	min-width: 60px;
	padding: 0;
}

.headerA {
	width: 100%;
	height: 20px;
	min-height: 40px;
	min-width: 60px;
	font-size: 20px;
	text-align: center;
	line-height: 40px;
	padding: 0;
}
.close1{
	color: black;
}
</style>
<script>
	//웹소켓 객체용 변수
	let alarmWs;
	//접속회원 아이디용 변수
	let senderNo;
	$(function() {
		senderNo = $("[name=memberNo]").val();
		if (senderNo != null) {
			$.ajax({
				url : "/alarmCount.kt",
				type : "post",
				data : {
					"memberNo" : senderNo
				},
				success : function(data) {
					$("#alarmCount").empty();
					$("#alarmCount").append(data);
				}
			});
		}
		//로그인 했는지 체크
		var loginCheck = $("#loginCheck").val();
		console.log(loginCheck);
		if (loginCheck == true) {
			connenctAlarm();
		}
	});

	$(".bell").on("click", function() {
		$.ajax({
			url : "/getAlarmList.kt",
			type : "post",
			data : {
				"memberNo" : senderNo
			},
			success : function(data) {
				$("#alarmCount").empty();
				$("#alarmCount").append(data);
			}
		});
	});
</script>
</head>
<body>
	<header class="p-3 border-bottom">
		<input type="hidden" value="${login }" id="loginCheck">
		<div class="alarm">
			<span id="senderNo">senderNo</span>
			<hr>
			<span id="sendContent">안녕하세요</span>
		</div>
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start headerNav">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<img src="/resources/img/KTRIP-removebg-preview.png" height="100px">
				</a>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 ms-lg-5"
					style="width: 27%;">
					<!-- 					<input type="search" class="form-control" placeholder="Search..." -->
					<!-- 						aria-label="Search"> -->
				</form>
				<c:choose>
					<c:when test="${empty sessionScope.m }">
						<ul
							class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
							<li><button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button></li>
							<li><a href="/joinFrm.kt" class="nav-link px-2 link-dark">회원가입</a></li>
						</ul>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Login</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="/login.kt" method="post">
										<div class="modal-body">
											<fieldset>
												ID:<input type="text" name="memberId" class="form-control" required><br> Password:<input
													type="password" name="memberPw" class="form-control" required><br>
											</fieldset>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Login</button>
											<button type="button" class="btn btn-secondary close1"
												data-bs-dismiss="modal">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="grade" value="${sessionScope.m.memberGrade }" />
						<!-- 관리자로 로그인 했을 때, 회원관리 버튼 보이도록 -->
						<c:choose>
							<c:when test="${grade eq '0' }">
								<!-- <!-- 관리자 로그인 -->
								<ul
									class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
									<!-- 									<li><a href="#" class="nav-link px-2 link-dark">위시리스트</a></li> -->
									<!-- 									<li><a href="#" class="nav-link px-2 link-dark">내 여행</a></li> -->
									<li><a href="/questionList.kt?reqPage=1"
										class="nav-link px-2 link-dark">문의하기</a></li>
									<li><a href="/allMember.kt"
										class="nav-link px-2 link-dark">회원관리</a></li>
									<!-- 관리자만 보이는 버튼 -->
									<li><span class="material-symbols-outlined bell">notifications</span><span
										id="alarmCount"></span></li>
								</ul>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton2" data-bs-toggle="dropdown"
										aria-expanded="false">내정보</button>
									<ul class="dropdown-menu dropdown-menu-dark"
										aria-labelledby="dropdownMenuButton2">
										<li><a class="dropdown-item" href="#"
											data-bs-toggle="modal" data-bs-target="#pointmodal">포인트</a></li>

										<li><a class="dropdown-item" href="/insertCoupon.kt">쿠폰</a></li>
										<li><a class="dropdown-item" href="/mypage.kt">마이페이지</a></li>
										<li><a class="dropdown-item" href="/sellerPage.kt">판매자
												페이지</a></li>
										<li><a class="dropdown-item" href="/blackListFrm.kt">블랙리스트
												관리</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/logout.kt">로그아웃 </a></li>
									</ul>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 판매자,구매자 로그인 -->
								<ul
									class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
									<!-- 									<li><a href="#" class="nav-link px-2 link-dark">위시리스트</a></li> -->
									<!-- 									<li><a href="#" class="nav-link px-2 link-dark">내 여행</a></li> -->
									<li><a href="/questionList.kt?reqPage=1"
										class="nav-link px-2 link-dark">문의하기</a></li>
									<li><span class="material-symbols-outlined bell">notifications</span><span
										id="alarmCount"></span></li>
								</ul>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton2" data-bs-toggle="dropdown"
										aria-expanded="false">내정보</button>
									<ul class="dropdown-menu dropdown-menu-dark"
										aria-labelledby="dropdownMenuButton2">
										<li><a class="dropdown-item" href="#"
											data-bs-toggle="modal" data-bs-target="#pointmodal">포인트</a></li>

										<li><a class="dropdown-item" href="/myCoupon.kt">내 쿠폰</a></li>
										<c:if test="${grade eq '2' }">
											<li><a class="dropdown-item" href="#">파트너 등록하기</a></li>
										</c:if>
										<li><a class="dropdown-item" href="/mypage.kt">마이페이지</a></li>
										<li><a class="dropdown-item" href="/allReserveFrm.kt">예약
												내역 확인</a></li>
										<c:if test="${grade eq '1' }">
											<li><a class="dropdown-item" href="/sellerPage.kt">판매자
													페이지</a></li>
										</c:if>
										<li><a class="dropdown-item" href="#"
											onclick="openList();">내 채팅</a>
											<form name="myChat" action="/chatList.kt" method="post">
												<input type="hidden" name="memberNo"
													value="${sessionScope.m.memberNo }">
											</form></li>
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
		<div class="modal fade" id="pointmodal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">내 보유 포인트</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="selectmenu">
							<div
								style="float: left; margin-left: 20%; width: 30%; font-size: 20px; text-align: center; line-height: 50px; border: 1px solid black;">
								잔여포인트</div>
							<div class="col"
								style="width: 30%; height: 50px; float: left; margin: 0px 5px auto; color: red; text-align: center; font-size: 30px;">
								${sessionScope.m.memberPoint }</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		aria-label="Tenth navbar example"
		style="min-width: 1000px; min-height: 40px">
		<div class="container-fluid headerDiv" style="min-height: 40px">
			<div
				class="collapse navbar-collapse justify-content-md-center navbarsExample08"
				id="navbarsExample08" style="min-width: 1000px; min-height: 40px">
				<ul class="navbar-nav headerUi">
					<li class="nav-item headerLi"><a
						class="nav-link active headerA" href="/AirMain.kt">항공편</a></li>
					<li class="nav-item headerLi"><a
						class="nav-link active headerA" href="/hostelMain.kt">숙소</a></li>
					<li class="nav-item headerLi"><a
						class="nav-link active headerA" href="/ticketMain.kt">티켓</a></li>
					<li class="nav-item headerLi"><a
						class="nav-link active headerA" href="/packageMain.kt">패키지</a></li>
					<li class="nav-item headerLi"><a
						class="nav-link active headerA" href="/companionMain.kt?reqPage=1">동행자
							모집</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>