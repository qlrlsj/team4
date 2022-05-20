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
	<jsp:include page= "/WEB-INF/views/common/header.jsp"/>
	<h3>1. 주소입력</h3>
	<form class="row g-3">
		<div class="col-md-4">
			<label for="inputState" class="form-label">카테고리 입력</label> <select
				id="inputState" class="form-select">
				<c:forEach var="tc" items="${ticketCategory}">
					<c:if test="${tc.parentCategoryId eq 0 }">
						<option>${tc.categoryName }</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
