<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content-wrap{
	width: 1000px;
	margin: 0 auto;
	margin-top: 30px;
}
.res-title{
	margin-bottom: 20px;
}
.content-text{
	margin-bottom: 20px;
}
.reserveInfo{
	width: 50%;
	margin: 0 auto;
}
.reInfo{
	border: 1px grey solid; 
	width:100%; 
	padding:10px;
	margin-top: 30px;
}
.selectBtn{
	margin-top: 40px;
}

</style>
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<div class="content-wrap">
		<div class="info-wrap">
		<div class="res-title"><h3>결제완료</h3></div>
		<hr>
		<div class="reserveInfo">
			<h5>예약정보</h5>
			
			<div  class="reInfo" >
			예약일 : ${rvInfo.reservationDate}<br>
			예약번호 : ${rvInfo.reservationNo}<br>
			예약자 이름: ${rvInfo.reserveName}<br>
			예약자 번호:  ${rvInfo.reservePhone}<br>
			예약자 이메일 :  ${rvInfo.reserveEmail}<br>
		</div>
		</div>
	</div>
		<div class="d-grid gap-2 col-6 mx-auto selectBtn">
			<button class="btn btn-outline-primary" onclick="location.href='/hostelMain.kt';" type="button">숙소 더 둘러보기</button>
			<button class="btn btn-outline-primary"onclick="location.href='/allReserveFrm.kt';" type="button">내 예약 확인하기</button>
		  </div>

	</div>


</body>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>