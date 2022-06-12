<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/airReserveComplete.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">
		<div class="orderNavi">
			<div class="orderDiv">
				<div>
					좌석 등급<br>및<br>좌석 선택
				</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv">
				<div>
					예약 정보<br>확인 및<br>약관 동의
				</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv">
				<div>결제</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv Proceeding">
				<div>
					예매 성공
				</div>
			</div>
		</div>
		
		<div class="airTableBase">
			<h2 class="naviH2">결재 정보 확인</h2>
			
			
		</div>
	</div>
	<script src="/resources/js/air/airReserveComplete.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>