<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/airSearch.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">
		
		<div class="p-3 mb-5" style="background-color:#FAC5B0">
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
						<div class="col">
							<button type="submit" class="btn btn-primary" style="float:right">
								<span class="material-icons">search</span>
							</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="airTable" style="width: 100%; height:692px; background-color: #B5D9E8">
			<div style="float: left; width: 50%; height:100%; background-color: #B3BEF5; overflow: hidden;" >
				<div class="routeMenu" style="width: 100%; height:50px; background-color:#90A5EB;">
					<span style="float: left; width: 25%; height:100%;">
						가는편
					</span>
					<span style="float: left; width: 50%; height:100%;">
						${AirSearch.airStart} - - - - - - -> ${AirSearch.airArrive}
					</span>
					<span style="float: left; width: 25%; height:100%;">
						${AirSearch.airStartDate}
					</span>
				</div>
				<table class="table table-hover airTableA" style="width: 100%; height: calc( 100% - 40px );">
					<thead style="width: 100%;">
						<tr class="table-dark" style="text-align: center; height:42px;">
							<th scope="col" style="width: 25%;">항공사</th>
							<th scope="col" style="width: 15%;">출발시간</th>
							<th scope="col" style="width: 15%;">도착시간</th>
							<th scope="col" style="width: 25%;">가격</th>
							<th scope="col" style="width: 20%;">선택</th>
						</tr>
					</thead>
					<tbody class="airTableBodyA">
						<c:if test="${empty startingList}">
							<div style="width: 100%; height:100%; text-align:center;">
								조회 결과가 없습니다.
							</div>
						</c:if>
						<c:forEach var="start" items="${startingList}">
							<tr class="forTable" style="height:60px">
								<td>${start.airLine}</td>
								<td>${start.airStartTime}</td>
								<td>${start.airEndTime}</td>
								<td>10,000</td>
								<td><button class="btn btn-primary" onclick="startAirSelect(this);">선택</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div style="float: left; width: 50%; height:100%; background-color: #F5E1B3; overflow: hidden;">
				<div class="routeMenu" style="width: 100%; height:50px; background-color:#F5CB69">
					<c:if test="${!empty AirSearch.airEndDate}">
						<span style="float: left; width: 25%; height:100%;">
							오는편
						</span>
						<span style="float: left; width: 50%; height:100%;">
							${AirSearch.airArrive} - - - - - - -> ${AirSearch.airStart}
						</span>
						<span style="float: left; width: 25%; height:100%;">
							${AirSearch.airEndDate}
						</span>
					</c:if>
				</div>
				<table class="table table-hover airTableB" style="width: 100%; height: calc( 100% - 40px );">
					<thead style="width: 100%;">
						<tr class="table-dark" style="text-align: center; height:42px;">
							<th scope="col" style="width: 25%;">항공사</th>
							<th scope="col" style="width: 15%;">출발시간</th>
							<th scope="col" style="width: 15%;">도착시간</th>
							<th scope="col" style="width: 25%;">가격</th>
							<th scope="col" style="width: 20%;">선택</th>
						</tr>
					</thead>
					<tbody class="airTableBodyB">
						<c:if test="${empty arrivalList}">
							<div style="width: 100%; height:100%; text-align:center;">
								조회 결과가 없습니다.
							</div>
						</c:if>
						<c:forEach var="end" items="${arrivalList}">
							<tr class="forTable" style="height:60px">
								<td>${end.airLine}</td>
								<td>${end.airStartTime}</td>
								<td>${end.airEndTime}</td>
								<td>10,000</td>
								<td><button class="btn btn-primary" onclick="endAirSelect(this);">선택</button></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
		<c:if test="${!empty startingList}">
			<div style="width:100%; height:100px">
				<button style="width:100%;  height:100%" onclick="sizeAdd();">
					<span class="material-symbols-outlined" style="font-size: 70px;">keyboard_double_arrow_down</span>			
				</button>
			</div>
		</c:if>
		<div style="width: 100%; height:160px; margin-top: 50px;">
			<div class="selectStartAirClass selectedAirSchedule" style="width: 100%; height:50%;">
				<div style="float: left; width: 25%; height:100%;">
					<div>
						가는편
					</div>
					<div class="selectStartAirLine">
<!-- 						항공사 -->
					</div>
				</div>
				<div style="float: left; width: 50%; height:100%;">
					<div>
						${AirSearch.airStart} - - - - - - - - - - - - - - - - - - -> ${AirSearch.airArrive}
					</div>
					<div class="selectStartAirStartTime" style="float: left; width:50%;">
<!-- 						출발 시간 -->
					</div>
					<div class="selectStartAirEndTime" style="float: left; width:50%;">
<!-- 						도착시간 -->
					</div>
				</div>
				<div style="float: left; width: 25%; height:100%;">
					<div>
						${AirSearch.airStartDate}
					</div>
					<div class="selectStartPay">
	<!-- 						가격 -->
					</div>
				</div>
			</div>

			<div class="selectEndAirClass selectedAirSchedule" style="width: 100%; height:50%;">
				<div style="float: left; width: 25%; height:100%;">
					<div>
						오는편
					</div>
					<div class="selectEndAirLine">

					</div>
				</div>
				<div style="float: left; width: 50%; height:100%;">
					<div>
						${AirSearch.airArrive} - - - - - - - - - - - - - - - - - - -> ${AirSearch.airStart}
					</div>
					<div class="selectEndAirStartTime" style="float: left; width:50%;">

					</div>
					<div class="selectEndAirEndTime" style="float: left; width:50%;">

					</div>
				</div>
				<div style="float: left; width: 25%;  height:100%;">
					<div>
						${AirSearch.airEndDate}
					</div>
					<div class="selectEndPay">

					</div>
				</div>
			</div>
		</div>
		<div>
			<form action="airReserve.kt">
				<input type="hidden" name="airStartSchedule">
				<input type="hidden" name="airEndSchedule">
				<button type="submit" class="btn btn-primary">예매</button>
			</form>
		</div>
	</div>
	<script src="/resources/js/air/airSearch.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>