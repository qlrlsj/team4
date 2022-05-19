<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
		<c:forEach var="air" items="${list }">
			<tr>
				<td>${air.reserveNo }</td>
				<td>${air.payNo }</td>
				<td>${air.airName}</td>
				<td>${air.memberNo}</td>
				<td>${air.airLevel}</td>
				<td>${air.orderDate}</td>
				<td>${air.airStart}</td>
				<td>${air.airEnd}</td>
				<td>${air.airPay}</td>
				<td>${air.memberName}</td>
				<td>${air.phone}</td>
				<td>${air.reserveState}</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>