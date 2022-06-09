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
<script>
function cancelCheck(){
	let check = confirm("판매자 해제를 신청하시겠습니까?");
	if(check){
		let memberNo;
		memberNo = ${sessionScope.m.memberNo};
		
		$.ajax({
			url : "/sellerCancelCheck.kt",
			type: "post",
			data : {"memberNo":memberNo},
			success : function(data) {
				console.log(data);
				if(data == "do"){
					cancel(memberNo);
				}else{
					alert("이미 해체 신청을 했습니다!");
				}
			}
		});
		
	}
};
function cancel(memberNo){
	console.log(memberNo);
		$.ajax({
			url : "/sellerCancel.kt",
			type: "post",
			data : {"memberNo":memberNo},
			success : function(data) {
				console.log(data);
				alert("해제 신청이 완료되었습니다!");
			}
		});	
}
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<hr>
	<div class="sellerWrap">
		<div class="list-group list-style">
			  <a href="/sellerPage.kt" class="list-group-item list-group-item-action" > 내 정보 </a>
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action active" aria-current="true">계정 관리</a>
		</div>
		<div class="div-content">
			<h2>계정 관리</h2>
			<div class="mb-3">
			<div class="content-title">마이페이지</div>
		</div>
			<div class="mb-3">
					<span id="sellerLabel">이름</span><span id="sellerContent"> ${sessionScope.m.memberName } </span>
			</div>
			<div class="mb-3">
				<span id="sellerLabel">아이디</span><span id="sellerContent"> ${sessionScope.m.memberId } </span>
			</div>
			<div class="mb-3">
				<span id="sellerLabel">연락처</span><span id="sellerContent"> ${sessionScope.m.memberPhone } </span>
			</div>
			<div class="mb-3">
				<span id="sellerLabel">이메일</span><span id="sellerContent"> ${sessionScope.m.memberEmail } </span>
			</div>
			<div class="mb-3">
				<button type="button" onclick="cancelCheck();">판매자 해제 신청</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>