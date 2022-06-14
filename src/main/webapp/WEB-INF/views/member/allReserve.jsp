<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/seller/seller.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.table{
	font-size: 15px;
	text-align: center;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
		<div class="div-content">
			<table class="table table-sm">
				<c:choose>
					<c:when test="${type eq 'hostel' }">
						<tr>
							<th>구분</th><th>날짜</th><th>예약 번호</th><th>상품명</th><th>구매자</th><th>연락처</th><th>옵션</th><th>인원</th><th>체크인</th><th>체크아웃</th><th>가격</th><th>결제번호</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td>${r.reserveDate }</td>
								<td>${r.reserveNo }</td>
								<td><a href="호스텔 상품 정보">${r.reserveName }</a></td>
								<td>${r.memberId }</td>
								<td>${r.memberPhone }</td>
								<!-- option1 = 숙소 옵션 -->
								<td>${r.option1 }</td>
								<!-- option2 = 인원 -->
								<td>${r.option2 }</td>
								<!-- option3 = 체크인 날짜 -->
								<td>${r.option3 }</td>
								<!-- option4 = 체크 아웃 날짜 -->
								<td>${r.option4 }</td>
								<td>${r.reservePrice }</td>
								<td>${r.payNo }</td>
							</tr>
						</c:forEach>			
					</c:when>	
					<c:when test="${type eq 'ticket' }">
						<tr>
							<th>구분</th><th>날짜</th><th>예약 번호</th><th>상품명</th><th>구매자</th><th>연락처</th><th>수량</th><th>가격</th><th>결제번호</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td>${r.reserveDate }</td>
								<td>${r.reserveNo }</td>
								<td><a href="티켓 상품 정보">${r.reserveName }</a></td>
								<td>${r.memberId }</td>
								<td>${r.memberPhone }</td>
								<!-- option1 = 수량 -->
								<td>${r.option1 }</td>
								<td>${r.reservePrice }</td>
								<td>${r.payNo }</td>
							</tr>
						</c:forEach>			
					</c:when>	
					<c:when test="${type eq 'package' }">
						<tr>
							<th>구분</th><th>날짜</th><th>예약 번호</th><th>상품명</th><th>구매자 정보</th><th>연락처</th><th>인원</th><th>가격</th><th>결제번호</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td>${r.reserveDate }</td>
								<td>${r.reserveNo }</td>
								<td><a href="패키지 상품 정보">${r.reserveName }</a></td>
								<td>${r.memberId }</td>
								<td>${r.memberPhone }</td>
								<!-- option2 = 인원 -->
								<td>${r.option2 }</td>
								<td>${r.reservePrice }</td>
								<td>${r.payNo }</td>
								<!-- option1 = 판매자 아이디 -->
							</tr>
						</c:forEach>			
					</c:when>	
				</c:choose>			
			</table>			
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/></body>
	
</body>
</html>