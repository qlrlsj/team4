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
	margin : 0 2%;
}
.row{
	width: 60%;
	text-align: center;
	margin : 0 auto;
}
.table{
	width: 80% !important;
	margin: 50px auto;
}
.table>th{
	width:10%;
}
.com-plus{
	width: 10%;
	margin-left: 80%;
}
select option[value=""][disabled] {
	display: none;
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
		    format: 'yyyy-mm-dd',
		    autoclose: true
		});
	});
	</script>

	<h2>동행자 모집</h2>
	<div class="div-content p-3 mb-5 bg-secondary row">
		<select class="form-select col comS" id="field">
			<option value="" disabled selected>지역</option>
	    	<option value="서울">서울</option>
	        <option value="부산">부산</option>
	        <option value="대구">대구</option>
	        <option value="인천">인천</option>
	        <option value="광주">광주</option>
	        <option value="대전">대전</option>
	        <option value="울산">울산</option>
	        <option value="세종">세종</option>
	        <option value="경기도">경기도</option>
	        <option value="강원도">강원도</option>
	        <option value="충청북도">충청북도</option>
	        <option value="충청남도">충청남도</option>
	        <option value="전라북도">전라북도</option>
	        <option value="전라남도">전라남도</option>
	        <option value="경상북도">경상북도</option>
	        <option value="경상남도">경상남도</option>
	        <option value="제주">제주</option>
	     </select>
		 <input class="col comS" type="text" id="datepick" placeholder="날짜">
	     <select class="form-select col comS" id="theme">
	     	<option value="" disabled selected>여행 테마</option>
	     	<option value="맛집 탐방">맛집 탐방</option>
	     	<option value="관광지">관광지</option>
	     	<option value="액티비티">액티비티</option>
	     </select>	
	     <select class="form-select col comS" id="progress">
	     	<option value="" disabled selected>모집 현황</option>
	     	<option value="모집 중">모집 중</option>
	     	<option value="모집 완료">모집 완료</option>
	     </select>
	     <button class="col btn btn-primary comS btn-sm">검색</button>
	</div>
	<c:if test="${not empty sessionScope.m }">
		<a href="/companionWriteFrm.kt" class="btn btn-primary btn-sm com-plus">동행자 모집 +</a>		
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