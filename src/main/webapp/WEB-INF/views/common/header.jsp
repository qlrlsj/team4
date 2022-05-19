<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cerulean/bootstrap.min.css" integrity="sha384-3fdgwJw17Bi87e1QQ4fsLn4rUFqWw//KU0g8TvV6quvahISRewev6/EocKNuJmEw" crossorigin="anonymous"> -->

<script src="resources/js/jquery-3.6.0.js"></script>
<script src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
<style>
.form-control:focus {
  color: #212529;
  background-color: #fff;
  border-color: #86b7fe;
  box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0) ;
  outline: 0;
}

</style>
</head>
<body>
	<header class="p-3 border-bottom">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<img src="resources/img/logo.png" height="100px">
				</a>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 ms-lg-5" style="width:27%;">
					<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
				</form>
				<c:choose>
					<c:when test="${empty sessionScope.m }">
						<ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
							<li><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button></li>
							<li><a href="#" class="nav-link px-2 link-dark">회원가입</a></li>
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
						<ul class="nav col-12 col-lg-auto ms-lg-auto mb-2 justify-content-center mb-md-0 me-lg-5">
							<li><a href="#" class="nav-link px-2 link-dark">위시리스트</a></li>
							<li><a href="#" class="nav-link px-2 link-dark">내 여행</a></li>
							<li><a href="#" class="nav-link px-2 link-dark">문의하기</a></li>
						</ul>
		
						<div class="dropdown text-end">
							<a href="#" class="d-block link-dark text-decoration-none" >
								<span class="material-symbols-outlined" style="font-size:40px;">account_circle_full</span>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="Tenth navbar example">
		<div class="container-fluid">
			<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"	href="#">항공편</a></li>
					<li class="nav-item"><a class="nav-link active" href="/hostelMain.kt">숙소</a></li>
					<li class="nav-item"><a class="nav-link active" href="/ticketMain.kt">티켓</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">패키지</a></li>
					<li class="nav-item"><a class="nav-link active" href="/companionMain.kt">동행자 모집</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>