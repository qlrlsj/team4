<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
		<tr>
			<th>항공권번호</th>
			<th>결재번호</th>
			<th>편명</th>
			<th>회원번호</th>
			<th>좌석등급</th>
			<th>예약날짜</th>
			<th>출발시간</th>
			<th>도착시간</th>
			<th>항공권가격</th>
			<th>이용자이름</th>
			<th>전화번호</th>
			<th>예약상태</th>

		</tr>
		<c:forEach var="a" items="${air}">
			<tr>
				<td>${a.reserveNo }</td>
				<td>${a.payNo }</td>
				<td>${a.airName}</td>
				<td>${a.memberNo}</td>
				<td>${a.airLevel}</td>
				<td>${a.orderDate}</td>
				<td>${a.airStart}</td>
				<td>${a.airEnd}</td>
				<td>${a.airPay}</td>
				<td>${a.memberName}</td>
				<td>${a.phone}</td>
				<td>${a.reserveState}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>