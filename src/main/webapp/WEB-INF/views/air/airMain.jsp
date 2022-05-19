<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />



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

	<div class="dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button"
			id="dropdownMenuButton1" data-bs-toggle="dropdown"
			aria-expanded="false">Dropdown button</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			<li><a class="dropdown-item" href="#">Action</a></li>
			<li><a class="dropdown-item" href="#">Another action</a></li>
			<li><a class="dropdown-item" href="#">Something else here</a></li>
		</ul>
	</div>
	
	============
	<!-- Example single danger button -->
<div class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    Action
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="#">Separated link</a></li>
  </ul>
</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>