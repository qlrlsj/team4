<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Package 상품등록</title>
<!-- 다음 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/package/insertPackage.js"></script> <!-- datepicker / summernote 라이브러리 -->
<style>

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">

		<div class="content-title">Package 상품 등록 페이지 입니다.</div>
		<form action="/insertPackage.kt" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			
			<div class="input-group mb-3">
				<span class="input-group-text">패키지명</span>
				<input type="text" class="form-control" name="packageTitle" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="패키지 이름을 입력해 주세요">
			</div>
			
			<div class="input-group mb-3">
				<span class="input-group-text">여행경비</span>
				<input type="text" class="form-control" name="packagePrice" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="1인당 금액을 입력해 주세요">
			</div>
			
			<div style="width: 80%; margin: auto;">
				<textarea class="summernote" name="packageContent"></textarea>
			</div>
			
			<div class="input-group mb-3">
			 	<input type="file" class="form-control" name="mainfile3">
			 	<label class="input-group-text">메인사진</label>
			</div>
			
			<div class="input-group mb-3">
			 	<input type="file" class="form-control" name="upfile" multiple>
			 	<label class="input-group-text">일반사진</label>
			</div>
			
			<button type="submit">서브밋</button>
		</form>
		
<!-- 		<form action="/insertFile.kt" method="post" enctype="multipart/form-data"> -->

<!-- 		</form> -->
	
	</div>
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





