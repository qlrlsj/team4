<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="div-content">
		<h2>ticketMain</h2>
		<a href="/insertTicketPage.kt">티켓상품 등록하기</button>
		<a href="/ticketView.kt?ticketNo=1">티켓 상세보기</a>
		<a href="/insertTest.kt">test</a>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>