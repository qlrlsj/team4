<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.airImgSize{
		width:100%;
		height:800px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="div-content">
		
		<div class="p-3 mb-2 bg-secondary">
			<form>
				<fieldset>
					<input type="text" class="form-control">
					<input type="text" class="form-control">
				</fieldset>
			</form>
		</div>
		
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/upload/air/air_p1.png" class="d-block w-100 airImgSize" alt="프로모션1">
				</div>
				<div class="carousel-item">
					<img src="/upload/air/air_p2.png" class="d-block w-100 airImgSize" alt="프로모션2">
				</div>
				<div class="carousel-item">
					<img src="/upload/air/air_p3.png" class="d-block w-100 airImgSize" alt="프로모션3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"	data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>