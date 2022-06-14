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
<script>
function reserveCancel(reserveNo,payNo ){
	var type = ${type};
	console.log(reserveNo);
	console.log(payNo);
	console.log(type);
	$.ajax({
		url : "/reserveCancel.kt",
		type: "post",
		data : {"reserveNo":reserveNo,"payNo":payNo,"type":type},
		success : function(data) {
			$("#"+reserveNo).remove();
			alert("예약 취소 완료");
		}
	});
}
</script>
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
					<div class="content-title">예약 상세</div>
				</div>
				<table class="table table-sm">
				<c:choose>
					<c:when test="${type eq 'hostel' }">
						<tr>
							<th>구분</th><th>날짜</th><th>상품 번호 / 예약 번호</th><th>상품명</th><th>구매자 정보</th><th>연락처</th><th>옵션</th><th>인원</th><th>체크인</th><th>체크아웃</th><th>가격</th><th>결제번호</th><th>결제 취소</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td>${r.reserveDate }</td>
								<td>
									<a href="#">${r.productNo }</a> / <a href="#">${r.reserveNo }</a>							
								</td>
								<td>${r.reserveName }</td>
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
								<td>
									<button type="submit" onclick="reserveCancel(${r.reserveNo},${r.payNo });" class="btn btn-primary">결제 취소</button>
								</td>
							</tr>
						</c:forEach>			
					</c:when>	
					<c:when test="${type eq 'ticket' }">
						<tr>
							<th>구분</th><th>날짜</th><th>상품 번호 / 예약 번호</th><th>상품명</th><th>구매자 정보</th><th>연락처</th><th>수량</th><th>가격</th><th>결제번호</th><th>결제 취소</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td>${r.reserveDate }</td>
								<td>
									<a href="#">${r.productNo }</a> / <a href="#">${r.reserveNo }</a>							
								</td>
								<td>${r.reserveName }</td>
								<td>${r.memberId }</td>
								<td>${r.memberPhone }</td>
								<!-- option1 = 수량 -->
								<td>${r.option1 }</td>
								<td>${r.reservePrice }</td>
								<td>${r.payNo }</td>
								<td>										
									<button type="submit" onclick="reserveCancel(${r.reserveNo},${r.payNo });" class="btn btn-primary">결제 취소</button>
								</td>
							</tr>
						</c:forEach>			
					</c:when>	
					<c:when test="${type eq 'package' }">
						<tr>
							<th>구분</th><th>날짜</th><th>상품 번호 / 예약 번호</th><th>상품명</th><th>구매자 정보</th><th>연락처</th><th>인원</th><th>가격</th><th>결제번호</th><th>결제 취소</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr id="${r.reserveNo }">
								<td>${r.type }</td>
								<td><a href="#">${r.reserveDate }</a></td>
								<td>
									<a href="#">${r.productNo }</a> / <a href="#">${r.reserveNo }</a>							
								</td>
								<td>${r.reserveName }</td>
								<td>${r.memberId }</td>
								<td>${r.memberPhone }</td>
								<!-- option2 = 인원 -->
								<td>${r.option2 }</td>
								<td>${r.reservePrice }</td>
								<td>${r.payNo }</td>
								<!-- option1 = 판매자 아이디 -->
								<td>
									<button type="submit" onclick="reserveCancel(${r.reserveNo},${r.payNo });" class="btn btn-primary">결제 취소</button>				
								</td>
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