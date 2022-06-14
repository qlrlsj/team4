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
</style>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<hr>
		<div class="sellerWrap">
			<div class="list-group list-style">
				  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action">상품 관리</a>
				  <a href="/sellerCash.kt" class="list-group-item list-group-item-action"  >정산 관리</a>
				  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action active" aria-current="true">예약 관리</a>
				  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
			</div>
			<div class="div-content">
				<div class="mb-3">
					<div class="content-title">예약 관리</div>
					<h3>상품 관리 페이지에서 예약을 관리해주세요</h3>
				</div>		
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>