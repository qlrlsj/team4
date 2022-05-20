<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Companion Main</title>
</head>
<style>
.comS{
	margin : 2%;
}
.row{
	width: 60%;
	margin : 5% auto;
	background-color: #333333;
}
.table{
	width: 80% !important;
	margin: 50px auto;
}
.table>th{
	width:10%''
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>
	$(function(){
		$("#datepick").datepicker({
		    format: 'dd-mm-yyyy',
		    autoclose: true
		});
	});
	</script>

	<h2>동행자 모집</h2>
	<div class="row">
		<select class="form-select col comS" id="exampleSelect1">
	    	<option>서울</option>
	        <option>부산</option>
	        <option>대구</option>
	        <option>인천</option>
	        <option>광주</option>
	        <option>대전</option>
	        <option>울산</option>
	        <option>세종</option>
	        <option>경기도</option>
	        <option>강원도</option>
	        <option>충청북도</option>
	        <option>충청남도</option>
	        <option>전라북도</option>
	        <option>전라남도</option>
	        <option>경상북도</option>
	        <option>경상남도</option>
	        <option>제주</option>
	     </select>
		 <input class="col comS" type="text" id="datepick" placeholder="날짜">
	     <select class="form-select col comS" id="exampleSelect1">
	     	<option>맛집 탐방</option>
	     	<option>관광지</option>
	     	<option>액티비티</option>
	     </select>	
	     <select class="form-select col comS" id="exampleSelect1">
	     	<option>모집 중</option>
	     	<option>모집 완료</option>
	     </select>
	     <button class="col">검색</button>
	</div>
	<c:if test="${not empty sessionScope.m }">
		<button>동행자 모집 +</button>		
	</c:if>
	<table class="table table-striped table-hover">
			<tr>
			<th>글번호</th><th>제목</th><th>지역</th><th>여행 테마</th><th>작성일</th><th>작성자</th><th>모집 여부</th>
			<c:forEach items="${list }" var="co" varStatus="i">
			<tr>
				<td>${(reqPage-1)*10 + i.count }</td>
				<td><a href="/companionView.kt?companionNo=${co.companionNo }">${co.companionTitle }</a></td>
				<td>${co.companionField }</td>
				<td>${co.companionTheme }</td>
				<td>${co.companionDate }</td>
				<td>${co.memberId }</td>
				<td>${co.companionProgress }</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="7">${pageNavi }</th>
			</tr>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>