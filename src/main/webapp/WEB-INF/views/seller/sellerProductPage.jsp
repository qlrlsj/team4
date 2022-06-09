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
			<table class="table table-sm">
				<tr>
					<th>상품 번호</th><th>상품명</th><th>평점</th><th>문의</th><th>수정 / 삭제</th>
				</tr>
				<c:forEach items="${list }" var="pr">
					<tr>
						<td><a href="#">${pr.productNo }</a></td>
						<td><a href="#">${pr.productName }</a></td>
						<td>${pr.productScore }</td>
						<td><button type="button" onclick="">문의 내역</button></td>
						<c:choose>
							<c:when test="${type eq 'hostel' }">
								<td><button type="button" class="btn btn-primary" onclick="">수정</button> / <button type="button" class="btn btn-primary" onclick="">삭제</button></td>
							</c:when>
							<c:when test="${type eq 'ticket' }">
								<td><button type="button" class="btn btn-primary" onclick="">수정</button> / <button type="button" class="btn btn-primary" onclick="">삭제</button></td>
							</c:when>
							<c:when test="${type eq 'package' }">
								<td><button type="button" class="btn btn-primary" onclick="">수정</button> / <button type="button" class="btn btn-primary" onclick="">삭제</button></td>
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