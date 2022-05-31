<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/airSelectGrade.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="div-content">
		<div class="orderNavi">
			<div class="orderDiv Proceeding">
				<div>
					좌석 등급<br>및<br>좌석 선택
				</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv">
				<div>
					예약 정보<br>확인 및<br>약관 동의
				</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv">
				<div>결재</div>
			</div>
			<div class="nextBar">></div>
			<div class="orderDiv">
				<div>
					예매 성공
				</div>
			</div>
		</div>
		
		<div class="airTableBase">
			<div class="airTableST">
				<div class="airTableTitle">
					<div style="float: left; width: 25%;">
						가는 항공편 선택
					</div>
					<div class="airTableTitleRoute" style="float: left; width: 50%;">
						<div style="float: left; width: 30%;">
							${airReserve.airStartST}
						</div>
						<div style="float: left; width: 40%;">
							→
						</div>
						<div style="float: left; width: 30%;">
							${airReserve.airArriveST}
						</div>
					</div>
					<div style="float: left; width: 25%;">
						${airReserve.airDateST}
					</div>
				</div>
				<table class="table airTable">
					<thead>
						<tr>
							<th scope="col">항공사</th>
							<th scope="col">편명</th>
							<th scope="col">출발시간</th>
							<th scope="col">도착시간</th>
							<th scope="col">이코노미석</th>
							<th scope="col">비지니스석</th>
							<th scope="col">VIP석</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${airReserve.airLineST}</th>
							<td>${airReserve.airNumberST}</td>
							<td>${airReserve.airStartTimeST}</td>
							<td>${airReserve.airEndTimeST}</td>
							<td colspan="3" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio1">50000</label>

								<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio2">200000</label>

								<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio3">400000</label>
							</td>
						</tr>
						</tbody>
					</tbody>
				</table>
			</div>
			
			<div class="airTableED">
				<div class="airTableTitle">
					<div style="float: left; width: 25%;">
						오는 항공편 선택
					</div>
					<div class="airTableTitleRoute" style="float: left; width: 50%;  height: 100%;">
						<div style="float: left; width: 30%;">
							${airReserve.airStartED}
						</div>
						<div style="float: left; width: 40%;">
							→
						</div>
						<div style="float: left; width: 30%;">
							${airReserve.airArriveED}
						</div>
					</div>
					<div style="float: left; width: 25%;">
						${airReserve.airDateED}
					</div>
				</div>
				<table class="table airTable">
					<thead>
						<tr>
							<th scope="col">항공사</th>
							<th scope="col">편명</th>
							<th scope="col">출발시간</th>
							<th scope="col">도착시간</th>
							<th scope="col">이코노미석</th>
							<th scope="col">비지니스석</th>
							<th scope="col">VIP석</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${airReserve.airLineED}</th>
							<td>${airReserve.airNumberED}</td>
							<td>${airReserve.airStartTimeED}</td>
							<td>${airReserve.airEndTimeED}</td>
							<td colspan="3" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio1">50000</label>

								<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio2">200000</label>

								<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked="">
								<label class="btn btn-outline-danger" for="btnradio3">400000</label>
							</td>
						</tr>
						</tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="/resources/js/air/airSelectGrade.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>