<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Companion View</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h2>동행자 모집</h2>
	<table class="table table-striped table-hover">
		<tr>
			<td colspan="4">${com.companionTitle }</td>
		</tr>
		<tr>
			<th>작성자</th><td>${com.memberId }</td><th>작성일</th><td>${com.companionDate }</td>
		</tr>
		<tr>
			<th>지역</th><th>여행일</th><th>여행 테마</th><th>모집 여부</th>
		</tr>
		<tr>
			<td>${com.companionField }</td><td>${com.trableDate }</td><td>${com.companionTheme }</td><td>${com.companionProgress }</td>
		</tr>
		<tr>
			<td colspan="4">${com.companionContent }</td>
		</tr>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>