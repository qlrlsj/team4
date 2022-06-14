<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 숫자포멧 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.form-control{
	max-width: 1000px;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="div-content">
	<div class="content-title"><a>${pc.memberId }</a>님의 예약내역</div>

	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">결제금액</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.reservePrice}원" readonly>
	</div>
	
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">패키지명</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.packageTitle}" readonly>
	</div>
	
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">출발날짜</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.packageStart} ~ " readonly>
	</div>
	
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">예약자 이메일</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.memberEmail}" readonly>
	</div>
	
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">예약자</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.memberName}" readonly>
	</div>
	
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">연락처</label> <input type="text" class="form-control"
		id="formGroupExampleInput" placeholder="${pc.memberPhone}" readonly>
	</div>
	
	
	
	
	</div>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>