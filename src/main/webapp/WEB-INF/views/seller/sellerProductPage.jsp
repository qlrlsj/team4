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
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action active" aria-current="true">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
		</div>
		<div class="div-content">
			<div class="mb-3">
				<div class="content-title">상품 페이지</div>
			</div>
			<c:choose>
				<c:when test="${type eq 'hostel' }">
					<button class="btn btn-primary" onclick="location.href='/insertHostelForm1.kt' ">숙소 상품 등록</button>
				</c:when>
				<c:when test="${type eq 'ticket' }">
					<button class="btn btn-primary" onclick="location.href='/insertTicketForm.kt' " >티켓 상품 등록</button>
				</c:when>
				<c:when test="${type eq 'package' }">
					<button class="btn btn-primary" onclick="location.href='/insertPackagePage.kt' ">패키지 상품 등록</button>
				</c:when>
			</c:choose>
			<table class="table table-sm">
				<tr>
					<th>상품 번호</th><th>상품명</th><th>평점</th><th>예약 관리</th><th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="pr">
					<tr>
						<td><a href="#">${pr.productNo }</a></td>
						<td><a href="#">${pr.productName }</a></td>
						<td>${pr.productScore }</td>
						<td>
							<form action="/sellerReserve.kt">
								<input type="hidden" name="productNo" value="${pr.productNo }">
								<input type="hidden" name="type" value="${type }">
								<button class="btn btn-primary" type="submit">예약 관리</button>
							</form>
						</td>
						<c:choose>
							<c:when test="${type eq 'hostel' }">
								<td><button type="button" class="btn btn-primary" onclick="">삭제</button></td>
							</c:when>
							<c:when test="${type eq 'ticket' }">
								<td><button type="button" class="btn btn-primary" onclick="">삭제</button></td>
							</c:when>
							<c:when test="${type eq 'package' }">
								<td><button type="button" class="btn btn-primary" onclick="">삭제</button></td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>			
			</table>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>