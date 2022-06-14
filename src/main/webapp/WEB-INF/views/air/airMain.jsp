<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/airMain.css">

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">
		
		<div class="p-3 mb-5" style="background-color:#FAC5B0;">
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="howtoway(0)">
				<label class="btn btn-outline-success" for="btnradio1">편도</label>
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="howtoway(1)" checked>
				<label class="btn btn-outline-success" for="btnradio2">왕복</label>
			</div>
			<form action="/airSearch.kt" method="get">
				<fieldset>
					<div class="row selectmenu">
						<!--출발지선택 -->
						<div class="col">
							<input type="text" name="airStart" class="form-control airStart" placeholder="출발지선택" data-bs-toggle="modal" data-bs-target="#selectStartModal" readonly>						
						</div>
						<div class="modal fade" id="selectStartModal" tabindex="-1" aria-labelledby="airStartLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="airStartLabel">출발지 선택</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="table">
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">인천(<label>INC</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">김포(<label>GMP</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">양양(<label>YNY</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">무안(<label>MWX</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">제주(<label>CJU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">대구(<label>TAE</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">청주(<label>CJJ</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">김해(<label>PUS</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">울산(<label>USN</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">여수(<label>RSU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">광주(<label>KWJ</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">군산(<label>KUV</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">원주(<label>WJU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">포항(<label>KPO</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">사천(<label>HIN</label>)</button></td>
												</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--도착지선택 -->
						<div class="col">
							<input type="text" name="airArrive" class="form-control airEnd" placeholder="도착지선택" data-bs-toggle="modal" data-bs-target="#selectEndModal" readonly>						
						</div>
						<div class="modal fade" id="selectEndModal" tabindex="-1" aria-labelledby="airEndLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="airEndLabel">도착지 선택</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="table">
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">인천(<label>INC</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">김포(<label>GMP</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">양양(<label>YNY</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">무안(<label>MWX</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">제주(<label>CJU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">대구(<label>TAE	</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">청주(<label>CJJ</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">김해(<label>PUS</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">울산(<label>USN</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">여수(<label>RSU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">광주(<label>KWJ</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">군산(<label>KUV</label>)</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">원주(<label>WJU</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">포항(<label>KPO</label>)</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">사천(<label>HIN</label>)</button></td>
												</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--가는날짜선택 -->
						<div class="col">
							<input type="text" name="airStartDate" class="datepicker form-control goDate" placeholder="가는 날 선택" readonly>
						</div>
						<!--오는날짜선택 -->
						<div class="col comback">
							<input type="text" name="airEndDate" class="datepicker form-control comDate" placeholder="오는 날 선택" readonly>						
						</div>
						<!--인원수선택 -->
						<div class="col">
							<input type="number" name="airAmount" class="form-control amount" placeholder="인원수" min=1 max="8">						
						</div>
						<!-- 버튼 -->
						<div class="col">
							<button type="button" class="btn btn-primary submitBtn" style="float:right">
								<span class="material-icons">search</span>
							</button>
							<button type="submit" style="display: none;" class="submitbtn"></button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		
		<div class="airCheckPage">
			<div class="myAirCheck">
				<h3>내 예약 내역확인</h3>
			</div>
			<c:choose>
				<c:when test="${empty sessionScope.m}">
					<form action="airCheck.kt" method="post">
						<fieldset>
							<input type="hidden" name="couponRange">
							<div class="selectmenu">
								<div class="space">
									이름
								</div>
								<div class="col">
									<input type="text" name="name" class=" form-control mu1" placeholder="이름 입력">						
								</div>
								<div class="space">
									전화번호
								</div>
								<div class="col">
									<input type="text" name="phone" class="form-control mu1" placeholder="휴대폰 번호 입력">						
								</div>
							</div>
							<div class="col airCheckBtn">
								<button type="button" class="btn btn-primary searchBtn">
									<span class="material-icons">manage_search</span>
								</button>
								<button type="submit" class="gosubmit" style="display: none;"></button>
							</div>
						</fieldset>
					</form>
				</c:when>
				<c:otherwise>
					<form action="airCheck.kt" method="post">
						<fieldset>
							<input type="hidden" name="couponRange">
							<div class="selectmenu">
								<div class="space">
									이름
								</div>
								<div class="col">
									<input type="text" name="name" class=" form-control mu1" value="${sessionScope.m.memberName }">						
								</div>
								<div class="space">
									전화번호
								</div>
								<div class="col">
									<input type="text" name="phone" class="form-control mu1" value="${sessionScope.m.memberPhone }">						
								</div>
							</div>
							<div class="col airCheckBtn">
								<button type="button" class="btn btn-primary searchBtn">
									<span class="material-icons">manage_search</span>
								</button>
								<button type="submit" class="gosubmit" style="display: none;"></button>
							</div>
						</fieldset>
					</form>
				</c:otherwise>
			</c:choose>

			
		</div>

		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/upload/air/air_p1.png" class="d-block w-100 airImgSize" alt="프로모션1">
				</div>
				<div class="carousel-item">
					<img src="/resources/upload/air/air_p2.png" class="d-block w-100 airImgSize" alt="프로모션2">
				</div>
				<div class="carousel-item">
					<img src="/resources/upload/air/air_p3.png" class="d-block w-100 airImgSize" alt="프로모션3">
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
	<script src="/resources/js/air/airMain.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>