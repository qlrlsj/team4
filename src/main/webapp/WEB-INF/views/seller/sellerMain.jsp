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
	<div>
		<div class="list-group list-style">
			  <a href="/sellerPage.kt" class="list-group-item list-group-item-action active" aria-current="true"> 내 정보 </a>
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReivewManage.kt" class="list-group-item list-group-item-action">후기 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
			  <a href="/sellerQnA.kt" class="list-group-item list-group-item-action">도움말 / 문의</a>
		</div>
		<div class="div-content">
			<h2>내 정보</h2>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>