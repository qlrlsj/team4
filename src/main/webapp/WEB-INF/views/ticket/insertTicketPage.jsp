<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<h3>1. 주소입력</h3>
	<form class="row g-3">
		<div class="col-md-4">
			<select id="category1" class="form-select">
				<option value="">1차 카테고리 선택</option>
			</select>
		</div>
		<div class="col-md-4">
			<select id="category2" class="form-select">
				<option value="">2차 카테고리 선택</option>
			</select>
		</div>
	</form>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	$(document).ready(function(){
		let selectBox1 = $("#category1");
		let selectBox2 = $("#category2");
		
		
		<c:forEach items="${ticketCategory }" var="tc">
		<c:if test="${tc.parentCategoryId eq 0}">
			selectBox1.append("<option value='${tc.categoryId}'>${tc.categoryName}</option>");
		</c:if>
		</c:forEach>
	});
	</script>
</body>
</html>
