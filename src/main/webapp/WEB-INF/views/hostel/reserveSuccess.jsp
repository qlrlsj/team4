<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
<h1>결제완료</h1>
예약일 : ${rvInfo.reservationDate}<br>
예약자 이름: ${rvInfo.reserveName}<br>
예약자 번호:  ${rvInfo.reservePhone}<br>
예약자 이메일 :  ${rvInfo.reserveEmail}<br>
</body>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>