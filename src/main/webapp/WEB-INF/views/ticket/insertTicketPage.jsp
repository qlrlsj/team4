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
	<h3>1. 주소입력</h3>
	<div class="mb-3">
		<label for="formGroupExampleInput" class="form-label">Example
			label</label> <input type="text" class="form-control"
			id="formGroupExampleInput" placeholder="Example input placeholder">
	</div>
	<div class="mb-3">
		<label for="formGroupExampleInput2" class="form-label">Another
			label</label> <input type="text" class="form-control"
			id="formGroupExampleInput2" placeholder="Another input placeholder">
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>