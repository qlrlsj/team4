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
		
		<div class="comment">
			<h1>예약이 완료되었습니다</h1>
			<c:choose>
				<c:when test="${!empty sessionScope.m}">
					<h3>예약내역은 마이페이지에서 확인할 수 있습니다</h3>
				</c:when>
				<c:otherwise>
					<h5>예약내역은 항공권>예약내역확인>이름,휴대폰입력으로 확인할 수 있습니다</h5>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="airTableBase" >
			<div class="airPlace">
				${airReserve.airStartST}  <->  ${airReserve.airArriveST}
			</div>

			<table class="payTable">
				<tr>
					<th>가는편 항공사</th>
					<td>${airReserve.airLineST}</td>
					<th>가는편 편명</th>
					<td>${airReserve.airNumberST}</td>
				</tr>
				<tr>
					<th>가는편 시간</th>
					<td>${airReserve.airStartTimeST}→${airReserve.airEndTimeST}</td>
					<th>가는편 날짜</th>
					<td>${airReserve.airDateST}</td>
				</tr>
				<tr>
					<th>가는편 좌석</th>
					<td colspan="3">${addStartSeatNum}</td>
				</tr>
				<tr>
					<th>오는편 항공사</th>
					<td>${airReserve.airLineED}</td>
					<th>오는편 편명</th>
					<td>${airReserve.airNumberED}</td>
				</tr>
				<tr>
					<th>오는편 시간</th>
					<td>${airReserve.airStartTimeED}→${airReserve.airEndTimeED}</td>
					<th>오는편 날짜</th>
					<td>${airReserve.airDateED}</td>
				</tr>
				<tr>
					<th>오는편 좌석</th>
					<td colspan="3">${addEndSeatNum}</td>
				</tr>
				<tr>
					<th>예매자 이름</th>
					<td colspan="3" class="userName">${airPayment.memberName}</td>
				</tr>
				<tr>
					<th>예매자 휴대폰번호</th>
					<td colspan="3" class="userPhone">${airPayment.phone}</td>
				</tr>
				<tr>
					<th>총 결제 금액</th>
					<td colspan="3">
						<div style="text-align: center;">
							<div class="paymentAmount" style="float: left;">${airPay}</div>
							<div style="float: left;"> (원)</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>