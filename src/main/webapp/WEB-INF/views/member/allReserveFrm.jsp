<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
		<div class="div-content">
			<h2>예약 확인 확인</h2>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="hostel">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit" >호스텔 예약 조회</button>
			</form>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="ticket">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit">티켓 예약 조회</button>
			</form>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="package">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit" >패키지 예약 조회</button>
			</form>				
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/></body>
</html>