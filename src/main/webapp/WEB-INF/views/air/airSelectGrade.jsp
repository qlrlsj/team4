<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<div>결제</div>
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
							<td colspan="3">
								<label class="test_obj">
									<input type="radio" name="airStartPay" value="1" checked>
									<span>50000</span>
								</label>
								
								<label class="test_obj">
									<input type="radio" name="airStartPay" value="2">
									<span>200000</span>
								</label>
								
								<label class="test_obj">
									<input type="radio" name="airStartPay" value="3">
									<span>400000</span>
								</label>
							</td>
						</tr>
						</tbody>
					</tbody>
				</table>
			</div>
			<c:if test="${!empty airReserve.airDateED}">
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
						<div class="edCheck" style="float: left; width: 25%;">
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
								<td colspan="3" >
									<label class="test_obj">
										<input type="radio" name="airEndPay" value="1" checked>
										<span>50000</span>
									</label>
									
									<label class="test_obj">
										<input type="radio" name="airEndPay" value="2">
										<span>200000</span>
									</label>
									
									<label class="test_obj">
										<input type="radio" name="airEndPay" value="3">
										<span>400000</span>
									</label>
								</td>
							</tr>
							</tbody>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
		<div style="text-align:center;">
			<div style="width: 100%; height:50px; margin-bottom: 100px;">
				<button class="btn btn-primary" style="width: 25%; text-align: center;" placeholder="좌석선택" data-bs-toggle="modal" data-bs-target="#selectSeat"> 좌석 선택</button>
			</div>
			<div class="modal fade" id="selectSeat" tabindex="-1" aria-labelledby="airStartSeat" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="airStartSeat">출발 항공권 좌석 선택</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="VipMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
							</div>

							<div class="BusinessMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Service_Img"></div>
								<div class="Line" style="margin-top: 80px;">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
							</div>

							<div class="EconomyMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">1</div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">									
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
							</div>
							<div class="Result">
								<div class="Pay"></div>
								<div>X</div>
								<div class="Amount">1</div>
								<div>=</div>
								<div class="Multiply">400000</div>
								<div>(원)</div>
							</div>
						</div>
						
						<div class="modal-footer">
							<button class="btn btn-primary" style="width: 45%; text-align: center;" placeholder="좌석선택" data-bs-toggle="modal" data-bs-target="#selectEndSeat">돌아갈 좌석선택</button>
						</div>
					</div>
				</div>
			</div>


			<!--왕복선 모달-->
			<div class="modal fade" id="selectEndSeat" tabindex="-1" aria-labelledby="airEndSeat" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="airEndSeat">돌아갈 항공권 좌석 선택</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="VipMenu">
								<div class="FrontDiv">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat"></div>
										<div class="VipBlank"></div>
										<div class="VipSeat"></div> 
									</div>
								</div>
							</div>

							<div class="BusinessMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
								<div class="Service_Img"></div>
								<div class="Line" style="margin-top: 80px;">
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat"></div>
										<div class="BusinessSeat"></div> 
									</div>
								</div>
							</div>

							<div class="EconomyMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">									
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat"></div>
										<div class="EconomySeat"></div> 
										<div class="EconomySeat"></div> 
									</div>
								</div>
							</div>
							<div class="Result">
								<div class="Pay">400000</div>
								<div>X</div>
								<div class="Amount">1</div>
								<div>=</div>
								<div class="Multiply">400000</div>
								<div>(원)</div>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">Save changes</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%; height:1450px">
				<img src="/resources/upload/air/seat.png">
			</div>
		</div>
	</div>
	<script src="/resources/js/air/airSelectGrade.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>