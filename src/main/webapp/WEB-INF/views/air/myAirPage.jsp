<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/myAirPage.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">
		
		<div class="comment">
			<h1>주문번호 ${AP.reserveNo} 예약 내역 입니다</h1>
		</div>
		<div class="airTableBase" >
			<div class="airPlace">
				${AP.airStart}  <->  ${AP.airEnd}
			</div>

			<table class="payTable">
				<tr>
					<th>가는편 항공사</th>
					<td>${ac1.air_line}</td>
					<th>가는편 날짜</th>
					<td>${ac1.air_date}</td>
				</tr>
				<tr>
					<th>가는편 시간</th>
					<td colspan="3">${ac1.air_start} -> ${ac1.air_end}</td>
				</tr>
				<tr>
					<th>가는편 좌석</th>
					<td colspan="3">
                        <c:forEach items="${SeatListST }" var="seat">
                            <span>${seat}</span>
                        </c:forEach>
                    </td>
				</tr>
				<tr>
					<th>오는편 항공사</th>
					<td>${ac2.air_line}</td>
					<th>오는편 날짜</th>
					<td>${ac2.air_date}</td>
				</tr>
				<tr>
					<th>오는편 시간</th>
					<td colspan="3">${ac2.air_start} -> ${ac2.air_end}</td>
				</tr>
				<tr>
					<th>오는편 좌석</th>
					<td colspan="3">
                        <c:forEach items="${SeatListED }" var="seat">
                            <span>${seat}</span>
                        </c:forEach>
                    </td>
				</tr>
				<tr>
					<th>예매자 이름</th>
					<td colspan="3" class="userName">${AP.memberName}</td>
				</tr>
				<tr>
					<th>예매자 휴대폰번호</th>
					<td colspan="3" class="userPhone">${AP.phone}</td>
				</tr>
				<tr>
					<th>총 결제 금액</th>
					<td colspan="3">
						<div style="text-align: center;">
							<div class="paymentAmount" style="float: left;">${AP.airPay}</div>
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