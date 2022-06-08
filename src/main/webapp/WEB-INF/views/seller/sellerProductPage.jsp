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
.sellerWrap{
	display : flex;
	justify-content: space-evenly;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
	<div class="sellerWrap">
		<div class="list-group list-style">
			  <a href="/sellerPage.kt" class="list-group-item list-group-item-action" > 내 정보 </a>
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action active" aria-current="true">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReivewManage.kt" class="list-group-item list-group-item-action">후기 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
			  <a href="/sellerQnA.kt" class="list-group-item list-group-item-action">도움말 / 문의</a>
		</div>
		<div class="div-content">
			<h2>상품 관리</h2>
			<table class="table table-sm">
			<c:choose>
				<c:when test="${type eq 'hostel' }">
					<tr>
						<th>상품명 / 상품 번호</th><th>에약 가능 시작일</th><th>예약 가능 종료일</th><th>가격</th><th>평점</th><th>총 예약 수</th>
					</tr>
					<span>hostel</span>
					<c:forEach items="${list }" var="ho">
						<tr>
							<td>${ho.getHostelName } / ${ho.getHostelCode }</td>
							<td>${ho.getBookStart }</td>
							<td>${ho.getBookEnd }</td>
							<td>${ho.getHostelScore }</td>
							<td>${ho.getHostelCode }</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${type eq 'ticket' }">
					<tr>
						<th>상품명 / 상품 번호</th><th>유효 기간</th><th>가격</th><th>평점</th><th>총 예약 수</th>
					</tr>
					<span>ticket</span>
					<c:forEach items="${list }" var="ti">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${type eq 'package' }">
					<tr>
						<th>상품명 / 상품 번호</th><th>상품 구분</th><th>가격</th><th>총 예약 수</th>
					</tr>
					<span>package</span>
					<c:forEach items="${list }" var="p">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
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