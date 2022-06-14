<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.sell{
	width : 200px;
	margin-bottom: 20px;
}
</style>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
		<div class="div-content">
			<div class="mb-3">
				<div class="content-title">예약 조회</div>
			</div>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="hostel">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary sell" type="submit" >호스텔 예약 조회</button>
			</form>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="ticket">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary sell" type="submit">티켓 예약 조회</button>
			</form>
			<form action="/allReserve.kt" method="post">
				<input type="hidden" name="type" value="package">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary sell" type="submit" >패키지 예약 조회</button>
			</form>				
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/></body>
</html>