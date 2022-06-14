<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/seller/seller.css">
<style>
.sell{
	width : 200px;
	margin-bottom: 20px;
}
.table{
	font-size: 15px;
	text-align: center;
}
</style>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<hr>
		<div class="sellerWrap">
			<div class="list-group list-style">
				  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action">상품 관리</a>
				  <a href="/sellerCash.kt" class="list-group-item list-group-item-action active" aria-current="true" >정산 관리</a>
				  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
				  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
			</div>
			<div class="div-content">
				<div class="mb-3">
					<div class="content-title">정산관리</div>
				</div>
				<table class="table table-sm">
				<tr>
					<th>구분</th><th>날짜</th><th>상품 번호 / 주문 번호</th><th>상품명</th><th>구매자 정보</th><th>금액</th><th>포인트</th><th>쿠폰</th><th>송금액</th>
				</tr>
				<c:choose>
					<c:when test="${type eq 'hostel' }">
						<c:forEach items="${list }" var="pay">
							<tr>
								<td>${type }</td>
								<td><a href="#">${pay.payDate }</a></td>
								<td>
									<a href="#">${pay.productNo }</a> / <a href="#">${pay.payNo }</a>							
								</td>
								<td>${pay.productName }</td>
								<td>${pay.memberName }</td>
								<td>${pay.productPrice }</td>
								<td>${pay.pointUse }</td>
								<td>${pay.couponUse }</td>
								<td>${pay.payPrice }</td>
							</tr>
						</c:forEach>			
					</c:when>
					<c:when test="${type eq 'ticket' }">
						<c:forEach items="${list }" var="pay">
							<tr>
								<td>${type }</td>
								<td><a href="#">${pay.payDate }</a></td>
								<td>
									<a href="#">${pay.productNo }</a> / <a href="#">${pay.payNo }</a>							
								</td>
								<td>${pay.productName }</td>
								<td>${pay.memberName }</td>
								<td>${pay.productPrice }</td>
								<td>${pay.pointUse }</td>
								<td>${pay.couponUse }</td>
								<td>${pay.payPrice }</td>
							</tr>
						</c:forEach>			
					</c:when>
					<c:when test="${type eq 'package' }">
						<c:forEach items="${list }" var="pay">
							<tr>
								<td>${type }</td>
								<td><a href="#">${pay.payDate }</a></td>
								<td>
									<a href="#">${pay.productNo }</a> / <a href="#">${pay.payNo }</a>							
								</td>
								<td>${pay.productName }</td>
								<td>${pay.memberName }</td>
								<td>${pay.productPrice }</td>
								<td>${pay.pointUse }</td>
								<td>${pay.couponUse }</td>
								<td>${pay.payPrice }</td>
							</tr>
						</c:forEach>			
					</c:when>
				</c:choose>			
			</table>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>