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
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
	<div class="sellerWrap">
		<div class="list-group list-style">
			  <a href="/sellerPage.kt" class="list-group-item list-group-item-action" > 내 정보 </a>
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action active" aria-current="true">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
		</div>
		<div class="div-content">
			<h2>상품 관리</h2>
			<form action="/sellerProduct.kt" method="post">
				<input type="hidden" name="type" value="hostel">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit" >호스텔 상품 조회</button>
			</form>
			<form action="/sellerProduct.kt" method="post">
				<input type="hidden" name="type" value="ticket">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit">티켓 상품 조회</button>
			</form>
			<form action="/sellerProduct.kt" method="post">
				<input type="hidden" name="type" value="package">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit" >패키지 상품 조회</button>
			</form>				
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>