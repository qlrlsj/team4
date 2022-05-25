<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content-title{
		margin: 0 auto;
	}
	.mb-3{
		width: 700px;
		position: center;
		margin: 0 auto;
	}
	tr>th {
		text-align: center;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="div-content">
		<div class="content-title">전체회원 관리</div>
		<table border="1" class="table table-hover">
			<tr>
				<th>번호</th><th>아이디</th><th>이름</th><th>회원레벨</th><th>등급</th><th>연락처</th><th>이메일</th><th>가입일</th><th>포인트</th><th>자기소개</th>
			</tr>
			<c:forEach items="${list }" var="m">
				<tr>
					<td align="center">${m.memberNo }</td>
					<td align="center">${m.memberId }</td>
					<td align="center">${m.memberName }</td>
					<td align="center">${m.memberLevel }</td>
					<td align="center">${m.memberGrade }</td>
					<td align="center">${m.memberPhone }</td>
					<td >${m.memberEmail }</td>
					<td align="center">${m.enrollDate }</td>
					<td align="center">${m.memberPoint }</td>
					<td>${m.memberIntro }</td>
				</tr>
			</c:forEach>
	</table>
		
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>