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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			<h2 class="naviH2">결재 정보 확인</h2>
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
			<div style="width: 100%; height:50px; text-align: center;">
				<button class="btn btn-primary" style="width: 25%; text-align: center;" placeholder="좌석선택" data-bs-toggle="modal" data-bs-target="#selectSeat"> 좌석 선택</button>
			</div>
		</div>
		<div class="airTableSelect" style="text-align:center;">

			<div class="modal fade modal1" id="selectSeat" tabindex="-1" aria-labelledby="airStartSeat" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="airStartSeat">출발 항공권 좌석 선택</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="VipMenu vc1">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat">V1</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V2</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V3</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V4</div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat">V5</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V6</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V7</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V8</div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat">V9</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V10</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V11</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V12</div> 
									</div>
								</div>
							</div>

							<div class="BusinessMenu bc1">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B1</div>
										<div class="BusinessSeat">B2</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B3</div>
										<div class="BusinessSeat">B4</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B5</div>
										<div class="BusinessSeat">B6</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B7</div>
										<div class="BusinessSeat">B8</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B9</div>
										<div class="BusinessSeat">B10</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B11</div>
										<div class="BusinessSeat">B12</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B13</div>
										<div class="BusinessSeat">B14</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B15</div>
										<div class="BusinessSeat">B16</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B17</div>
										<div class="BusinessSeat">B18</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B19</div>
										<div class="BusinessSeat">B20</div> 
									</div>
									<div class="BusinessBlock">
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B21</div>
										<div class="BusinessSeat">B22</div> 
									</div>
								</div>
								<div class="Service_Img"></div>
								<div class="Line" style="margin-top: 80px;">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B23</div>
										<div class="BusinessSeat">B24</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B25</div>
										<div class="BusinessSeat">B26</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B27</div>
										<div class="BusinessSeat">B28</div> 
									</div>
								</div>
							</div>

							<div class="EconomyMenu ec1">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E1</div>
										<div class="EconomySeat">E2</div> 
										<div class="EconomySeat">E3</div> 
									</div>
									<div class="EconomyBlock">										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E4</div>
										<div class="EconomySeat">E5</div> 
										<div class="EconomySeat">E6</div> 
									</div>
									<div class="EconomyBlock">									
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E7</div>
										<div class="EconomySeat">E8</div> 
										<div class="EconomySeat">E9</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E10</div> 
										<div class="EconomySeat">E11</div> 
										<div class="EconomySeat">E12</div> 
										<div class="EconomySeat">E13</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E14</div>
										<div class="EconomySeat">E15</div> 
										<div class="EconomySeat">E16</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E17</div>
										<div class="EconomySeat">E18</div> 
										<div class="EconomySeat">E19</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E20</div> 
										<div class="EconomySeat">E21</div> 
										<div class="EconomySeat">E22</div> 
										<div class="EconomySeat">E23</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E24</div>
										<div class="EconomySeat">E25</div> 
										<div class="EconomySeat">E26</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E27</div>
										<div class="EconomySeat">E28</div> 
										<div class="EconomySeat">E29</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E30</div> 
										<div class="EconomySeat">E31</div> 
										<div class="EconomySeat">E32</div> 
										<div class="EconomySeat">E33</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E34</div>
										<div class="EconomySeat">E35</div> 
										<div class="EconomySeat">E36</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E37</div>
										<div class="EconomySeat">E38</div> 
										<div class="EconomySeat">E39</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E40</div> 
										<div class="EconomySeat">E41</div> 
										<div class="EconomySeat">E42</div> 
										<div class="EconomySeat">E43</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E44</div>
										<div class="EconomySeat">E45</div> 
										<div class="EconomySeat">E46</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E47</div>
										<div class="EconomySeat">E48</div> 
										<div class="EconomySeat">E49</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E50</div> 
										<div class="EconomySeat">E51</div> 
										<div class="EconomySeat">E52</div> 
										<div class="EconomySeat">E53</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E54</div>
										<div class="EconomySeat">E55</div> 
										<div class="EconomySeat">E56</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E57</div>
										<div class="EconomySeat">E58</div> 
										<div class="EconomySeat">E59</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E60</div> 
										<div class="EconomySeat">E61</div> 
										<div class="EconomySeat">E62</div> 
										<div class="EconomySeat">E63</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E64</div>
										<div class="EconomySeat">E65</div> 
										<div class="EconomySeat">E66</div> 
									</div>
								</div>
							</div>
							<div class="Result">
								<div class="Pay">0</div>
								<div>X</div>
								<div class="Amount">0</div>
								<div>=</div>
								<div class="Multiply">0</div>
								<div>(원)</div>
							</div>
						</div>
						
						<div class="modal-footer">
							<c:if test="${!empty airReserve.airDateED}">
								<button class="btn btn-primary" style="width: 45%; text-align: center;" placeholder="좌석선택" data-bs-toggle="modal" data-bs-target="#selectEndSeat">돌아갈 좌석선택</button>
							</c:if>
							<c:if test="${empty airReserve.airDateED}">
								<button type="button" style="width: 45%; text-align: center;" class="btn btn-primary selectEnd" data-bs-dismiss="modal">선택 완료</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>


			<!--왕복선 모달-->
			<div class="modal fade modal2" id="selectEndSeat" tabindex="-1" aria-labelledby="airEndSeat" aria-hidden="true">
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
										<div class="VipSeat">V1</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V2</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V3</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V4</div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat">V5</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V6</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V7</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V8</div> 
									</div>
								</div>
								<div class="Line">
									<div class="VipBlock">
										<div class="VipSeat">V9</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V10</div>
									</div>
									<div class="VipBlock">
										<div class="VipSeat">V11</div>
										<div class="VipBlank"></div>
										<div class="VipSeat">V12</div> 
									</div>
								</div>
							</div>

							<div class="BusinessMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B1</div>
										<div class="BusinessSeat">B2</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B3</div>
										<div class="BusinessSeat">B4</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B5</div>
										<div class="BusinessSeat">B6</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B7</div>
										<div class="BusinessSeat">B8</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B9</div>
										<div class="BusinessSeat">B10</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B11</div>
										<div class="BusinessSeat">B12</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B13</div>
										<div class="BusinessSeat">B14</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B15</div>
										<div class="BusinessSeat">B16</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B17</div>
										<div class="BusinessSeat">B18</div> 
									</div>
								</div>
								<div class="Line">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B19</div>
										<div class="BusinessSeat">B20</div> 
									</div>
									<div class="BusinessBlock">
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B21</div>
										<div class="BusinessSeat">B22</div> 
									</div>
								</div>
								<div class="Service_Img"></div>
								<div class="Line" style="margin-top: 80px;">
									<div class="BusinessBlock">
										<div class="BusinessSeat">B23</div>
										<div class="BusinessSeat">B24</div> 
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B25</div>
										<div class="BusinessSeat">B26</div>
									</div>
									<div class="BusinessBlock">
										<div class="BusinessSeat">B27</div>
										<div class="BusinessSeat">B28</div> 
									</div>
								</div>
							</div>

							<div class="EconomyMenu">
								<div class="FrontDiv"">
									<div class="Front">정면</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E1</div>
										<div class="EconomySeat">E2</div> 
										<div class="EconomySeat">E3</div> 
									</div>
									<div class="EconomyBlock">										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E4</div>
										<div class="EconomySeat">E5</div> 
										<div class="EconomySeat">E6</div> 
									</div>
									<div class="EconomyBlock">									
									</div>
									<div class="EconomyBlock EconomyLastBlock">
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E7</div>
										<div class="EconomySeat">E8</div> 
										<div class="EconomySeat">E9</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E10</div> 
										<div class="EconomySeat">E11</div> 
										<div class="EconomySeat">E12</div> 
										<div class="EconomySeat">E13</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E14</div>
										<div class="EconomySeat">E15</div> 
										<div class="EconomySeat">E16</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E17</div>
										<div class="EconomySeat">E18</div> 
										<div class="EconomySeat">E19</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E20</div> 
										<div class="EconomySeat">E21</div> 
										<div class="EconomySeat">E22</div> 
										<div class="EconomySeat">E23</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E24</div>
										<div class="EconomySeat">E25</div> 
										<div class="EconomySeat">E26</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E27</div>
										<div class="EconomySeat">E28</div> 
										<div class="EconomySeat">E29</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E30</div> 
										<div class="EconomySeat">E31</div> 
										<div class="EconomySeat">E32</div> 
										<div class="EconomySeat">E33</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E34</div>
										<div class="EconomySeat">E35</div> 
										<div class="EconomySeat">E36</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E37</div>
										<div class="EconomySeat">E38</div> 
										<div class="EconomySeat">E39</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E40</div> 
										<div class="EconomySeat">E41</div> 
										<div class="EconomySeat">E42</div> 
										<div class="EconomySeat">E43</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E44</div>
										<div class="EconomySeat">E45</div> 
										<div class="EconomySeat">E46</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E47</div>
										<div class="EconomySeat">E48</div> 
										<div class="EconomySeat">E49</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E50</div> 
										<div class="EconomySeat">E51</div> 
										<div class="EconomySeat">E52</div> 
										<div class="EconomySeat">E53</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E54</div>
										<div class="EconomySeat">E55</div> 
										<div class="EconomySeat">E56</div> 
									</div>
								</div>
								<div class="EconomyLine">
									<div class="EconomyBlock">
										<div class="EconomySeat">E57</div>
										<div class="EconomySeat">E58</div> 
										<div class="EconomySeat">E59</div> 
									</div>
									<div class="EconomyBlock">
										<div class="EconomySeat">E60</div> 
										<div class="EconomySeat">E61</div> 
										<div class="EconomySeat">E62</div> 
										<div class="EconomySeat">E63</div> 										
									</div>
									<div class="EconomyBlock EconomyLastBlock">
										<div class="EconomySeat">E64</div>
										<div class="EconomySeat">E65</div> 
										<div class="EconomySeat">E66</div> 
									</div>
								</div>
							</div>
							<div class="Result">
								<div class="Pay">0</div>
								<div>X</div>
								<div class="Amount">0</div>
								<div>=</div>
								<div class="Multiply">0</div>
								<div>(원)</div>
							</div>
						</div>
						
						<div class="modal-footer">
							
							<button type="button" style="width: 45%; text-align: center; color: white;" class="btn btn-warning backMenu" data-bs-toggle="modal" data-bs-target="#selectSeat">이전 메뉴</button>
							<button type="button" style="width: 45%; text-align: center;" class="btn btn-primary selectEnd" data-bs-dismiss="modal">선택 완료</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달종료 -->
			<div class="SelectSeatMenu">
				<h2 class="naviH2">좌석 선택</h2>
				<div class="startSelectSeat SelectSeat">
					<div style="float: left; width: 30%; height: 100%; font-size: 30px;">
						출발 선택된 좌석번호 :
					</div>
					<div class="addStartSeat" style="float: left; width: 70%; height: 100%;">
					</div>
				</div>
				<div class="EndSelectSeat SelectSeat">
					<div style="float: left; width: 30%; height: 100%; font-size: 30px;">
						왕복 선택된 좌석번호 :
					</div>
					<div class="addEndSeat" style="float: left; width: 70%; height: 100%;">
					</div>
				</div>
				<div>
					<button class="btn btn-primary nextMenu">진행</button>
				</div>
			</div>

			<div style="width: 100%; height:1600px">
				<h2 class="naviH2">좌석배치도</h2>
				<img src="/resources/upload/air/seat.png">
			</div>
		</div>

		<!-- 약관동의페이지 -->
		<div class="airTableBase2" style="display: none;">
			<h2 class="naviH2" style="margin-top: 100px;">선택 좌석 정보 & 예약자 정보 입력</h2>
			<table class="table airTable2">
				<thead>
					<tr style="text-align: center;">
						<th scope="col">항공사</th>
						<th scope="col">편명</th>
						<th scope="col">출발시간</th>
						<th scope="col">도착시간</th>
						<th scope="col">출발지</th>
						<th scope="col">목적지</th>
						<th scope="col">날짜</th>
						<th scope="col">가격</th>
						<th scope="col">선택좌석</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center;">
						<th scope="row">${airReserve.airLineST}</th>
						<td>${airReserve.airNumberST}</td>
						<td>${airReserve.airStartTimeST}</td>
						<td>${airReserve.airEndTimeST}</td>
						<td>${airReserve.airStartST}</td>
						<td>${airReserve.airArriveST}</td>
						<td>${airReserve.airDateST}</td>
						<td class="addStartPay">0</td>
						<td class="addStartSeatNum"></td>
					</tr>
					<tr class="comback" style="text-align: center;">
						<th scope="row">${airReserve.airLineED}</th>
						<td>${airReserve.airNumberED}</td>
						<td>${airReserve.airStartTimeED}</td>
						<td>${airReserve.airEndTimeED}</td>
						<td>${airReserve.airStartED}</td>
						<td>${airReserve.airArriveED}</td>
						<td>${airReserve.airDateED}</td>
						<td class="addEndPay">0</td>
						<td class="addEndSeatNum"></td>
					</tr>
				</tbody>
			</table>
			<div class="airTable3Tool">
				<c:choose>
					<c:when test="${!empty m}">
						<table class="airTable3">
							<tbody>
								<tr>
									<th>예약자이름</th>
									<td><input type="text" name="bookerName" value="${sessionScope.m.memberName }" readonly></td>
									<th>이메일</th>
									<td><input type="text" name="memberEmail" value="${sessionScope.m.memberEmail }" readonly></td>
									<th>휴대폰번호</th>
									<td><input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }" readonly></td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<table class="airTable3">
							<tbody>
								<tr>
									<th>예약자이름</th>
									<td><input type="text" name="bookerName"></td>
									<th>이메일</th>
									<td><input type="text" name="memberEmail"></td>
									<th>휴대폰번호</th>
									<td><input type="text" name="memberPhone"></td>
								</tr>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			<h2 class="naviH2">약관 동의</h2>
			

			<div class="terms">
				<table>
					<tr>
						<td>
							<br>
							<div style="margin-left: 100px; width: 250px; font-size: 20px;"> <b>항공권 예매 약관 동의</b></div>
							<br> 
							<textarea class="termsTextBox" rows="20" cols="150">
제 1 조 (정의)
본 약관에 사용하는 용어의 정의는 다음과 같다.
1. "국내 항공여객운송(이하 '운송' 이라 한다)" 이라 함은 유상 또는 무상운송 여부에 관계없이 여객과의 운송계약상 그 출발지와 목적지 및 도중 착륙지가 대한민국 영토 내에 위치하는 항공운송을 말한다.
2. "항공권" 이라 함은 ㈜티웨이항공(이하 '항공사'라 한다) 또는 티웨이항공이 지정한 대리인(이하 '대리점'이라 한다)이 본 운송약관에 따라 국내항공운항 노선상의 여객운송을 위하여 발행한 항공사의 데이터베이스에 기록된 전자증표 또는 종이증표를 말한다.
3. "항공권 예약 발권 확인서" 라 함은 항공사가 전자항공권으로 여행하는 승객에게 발행하는 승객 성명, 항공편, 고지사항을 포함하는 문서를 말한다.
4. "비즈니스 운임" 이라 함은 국내선 구간의 항공운송을 위하여 항공사가 정한 비즈니스석의 여객운임을 말한다.
5. "일반석 일반운임" 이라 함은 국내선 구간의 항공운송을 위하여 항공사가 정한 비할인 정규 여객운임을 말한다.
6. "일반석 스마트운임"이라 함은 항공사가 일반운임을 기준으로 예매시점에 따라 적용운임을 탄력적으로 조정하여 운영하는 여객운임을 말한다.
7. "일반석 이벤트운임"이라 함은 항공사가 특별히 정해진 기간에 한하여 항공사가 정하는 별도의 판매조건을 기준으로 운영하는 특별운임을 말한다.
8. “왕복여행” 이라 함은 한 지점으로부터 여행을 개시하여 그 출발 지점에 되돌아 오는 여행으로서 왕편 및 복편 운임의 동일여부를 불문하고 왕복 편을 동일 경로로 여행하는 경우를 말한다.
9. "수하물" 이라 함은 여객이 여행시 휴대하거나 탁송을 의뢰한 소지품 및 물품을 말한다. 단, 동일한 품목을 다량 운송하는 경우에는 상업적 목적으로 간주하며 특별한 사유가 없는 한 수하물로 인정하지 않는다. 
10. "위탁수하물" 이라 함은 여객이 여행시에 유효한 항공권과 함께 제출한 물품에 대해 항공사가 접수하고 수하물표를 발행한 수하물을 말한다.
11. "휴대수하물" 이라 함은 위탁 수하물 이외의 수하물을 말한다.
12. "초과수하물" 이라 함은 항공사가 정한 무료 수하물 허용량을 초과한 수하물을 말한다.
13. "수하물표" 라 함은 위탁 수하물의 운송을 위하여 항공사가 발행하는 증표를 말한다.
14. "단체여객" 이라 함은 동시에 동일 구간을 여행하는 10명 이상의 여객으로 사전에 동일 단체로 예약이 신청된 여객을 말한다.
15. "성인" 이라 함은 만 13 세 이상의 여객을 말한다.
16. "소아" 라 함은 만 2 세 이상 만 13세 미만의 여객을 말한다.
17. "유아" 라 함은 만 2 세 미만의 여객을 말한다.
18. "공항이용료"라 함은 정부 당국 또는 공항 운영자에 의하여 부과되어 여객으로부터 징수하는 이용료를 말한다.

제 12 조 (운임 및 요금의 적용)
1. 여객운임 및 요금은 항공사가 정하는 운임 및 요금표에 의한다.
2. 여객운임 및 요금은 당해 출발지 공항으로부터 도착지 공항까지의 운송에 대하여 적용한다.
3. 여객이 지불하는 운임 또는 요금 총액 중 100원 미만의 단수 액은 절상하여 처리한다.
4. 적용운임 및 요금은 여객이 구매하는 시점에 유효한 해당편의 출발일 운임 및 요금으로 한다.
5. 여객의 사정으로 인하여 여정변경이 이루어진 경우에 지불된 운임 또는 요금이 변경될 시 적용운임의 차액을 환불하거나 추징한다.

제 14 조 (유아 및 소아 운임)
1. 성인에 의하여 동반되고 좌석을 점유하지 않는 유아는 성인 1인당 1인에 한하여 무임으로 한다.
2. 소아, 별도로 좌석을 점유하는 유아 또는 성인 1 인이 동반하는 유아 중 1 인을 초과하는 유아에 대하여는 해당 구간의 소아운임을 적용하여 징수한다. 단, 일반석 이벤트 운임 및 일부 일반석 스마트 운임, 비즈니스 운임에 대해서는 소아할인이 적용되지 않는다.
							</textarea> 
							<br>
							<br> 
							<div>
								<div class="btnIcon"><span class="material-symbols-outlined">check_circle</span></div> 
								<div class="btnText">상기 내용을 읽고 이해했습니다. </div>
							</div>
							<br>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<div style="margin-left: 100px; width: 250px; font-size: 20px;"> <b>개인정보 수집 동의</b></div>
							<br> 
							<textarea class="termsTextBox" rows="20" cols="150">
첫째, 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.

회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호

둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록

셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.

넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보

다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
							</textarea> 
							<br>
							<br> 
							<div>
								<div class="btnIcon"><span class="material-symbols-outlined">check_circle</span></div> 
								<div class="btnText">상기 내용을 읽고 개인정보 수집에 동의합니다. </div>
							</div>
							<br>
							<br>
						</td>
					</tr>
				</table>
				<div style="float: right;">
					<button class="btn btn-primary nextMenu2">진행</button>
				</div>
			</div>
		</div>
		<!-- 결제페이지 -->
		<div class="airTableBase3" style="display: none;">
			<h2 class="naviH2" style="margin-top: 100px;">항공권 정보 확인</h2>
			<table class="table airTable4">
				<thead>
					<tr style="text-align: center;">
						<th scope="col">편명</th>
						<th scope="col">날짜</th>
						<th scope="col" colspan="2">출발→도착</th>
						<th scope="col">선택좌석</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center;">
						<td class="airST">${airReserve.airNumberST}</td>
						<td>${airReserve.airDateST}</td>
						<td>${airReserve.airStartST}→${airReserve.airArriveST}</td>
						<td>${airReserve.airStartTimeST}→${airReserve.airEndTimeST}</td>
						<td class="addStartSeatNum"></td>
						<td class="addStartPay">0</td>
					</tr>
					<tr class="comback" style="text-align: center;">
						<td>${airReserve.airNumberED}</td>
						<td>${airReserve.airDateED}</td>
						<td>${airReserve.airStartED}→${airReserve.airArriveED}</td>
						<td>${airReserve.airStartTimeED}→${airReserve.airEndTimeED}</td>
						<td class="addEndSeatNum"></td>
						<td class="addEndPay">0</td>
					</tr>
				</tbody>
			</table>
			
			<h2 class="naviH2" style="margin-top: 100px;">결제 정보</h2>
			<div class="payMenu">
				<table class="payTable">
					<tbody>
						<tr>
							<th>예매자 이름</th>
							<td class="userName"></td>
						</tr>
						<tr>
							<th>예매자 휴대폰번호</th>
							<td class="userPhone"></td>
						</tr>
						<tr>
							<th>예매자 이메일</th>
							<td class="userEmail"></td>
						</tr>
						<tr>
							<th>예매 가격</th>
							<td>
								<div class="payAmount" style="float: left;">0</div>
								<div style="float: left;"> (원)</div>
							</td>
						</tr>
						<tr>
							<th>포인트 사용금액</th>
							<td>
								<c:choose>
									<c:when test="${!empty m}">
										<input type="text" class="pointSelect" style="float: left; margin-right: 50px;" value="0">
										<div style="float: left; color: rgb(255, 200, 70);" class="memberPoint">${sessionScope.m.memberPoint}</div>
										<div style="float: left; color: rgb(255, 200, 70);"> (원) 사용가능</div>
									</c:when>
									<c:otherwise>
										<div class="pointSelect" style="float: left; margin-right: 50px;" value="0">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>쿠폰 적용 할인 금액</th>
							<td >
								<div class="coupon" style="float: left;">0</div>
								<div style="float: left;"> (원)</div>
								
								<c:if test="${!empty m}">
									<div class="memberNo" style="display: none;">${sessionScope.m.memberNo}</div>
									<div class="memberLevel" style="display: none;">${sessionScope.m.memberLevel}</div>
									<button class="couponSelect" style="float: left;" data-bs-toggle="modal" data-bs-target="#selectcoupon">쿠폰선택</button>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>총 결제 금액</th>
							<td>
								<div class="paymentAmount" style="float: left;"></div>
								<div style="float: left;"> (원)</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="modal fade modal3" id="selectcoupon" tabindex="-1" aria-labelledby="coupon" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content"" >
							<div class="modal-header">
								<h5 class="modal-title" id="selectcoupon">쿠폰선택</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<table class="table airTable5">
									<thead>
										<tr style="text-align: center;">
											<th scope="col"><span class="material-symbols-outlined">done</span></th>
											<th scope="col">쿠폰 이름</th>
											<th scope="col">할인가격</th>
											<th scope="col">할인율</th>
											<th scope="col">유효기간</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary selectedCoupon" style="width: 200px; text-align: center;" data-bs-dismiss="modal">쿠폰적용</button>
							</div>
						</div>
					</div>
				</div>
				<button class="btn btn-primary nextMenu3">결제</button>
				<button class="btn btn-primary payCompleteBtn">결제완료버튼(테스트용)</button>
			</div>
		</div>
		<form action="/payComplete.kt" method="post">
			<input type="hidden" name="payNo">
			<c:choose>
				<c:when test="${!empty m}">
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="memberNo" value="-1">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="memberName">
			<input type="hidden" name="airPay">
			<input type="hidden" name="phone">
			<input type="hidden" name="airStart" value="${airReserve.airStartST}">
			<input type="hidden" name="airEnd" value="${airReserve.airArriveST}">
				
			<input type="hidden" name="airLineST" value="${airReserve.airLineST}">
			<input type="hidden" name="airNumberST" value="${airReserve.airNumberST}">
			<input type="hidden" name="airStartTimeST" value="${airReserve.airStartTimeST}">
			<input type="hidden" name="airEndTimeST" value="${airReserve.airEndTimeST}">
			<input type="hidden" name="airStartST" value="${airReserve.airStartST}">
			<input type="hidden" name="airArriveST" value="${airReserve.airArriveST}">
			<input type="hidden" name="airDateST" value="${airReserve.airDateST}">
			<input type="hidden" name="addStartSeatNum">
			<input type="hidden" name="airLevelST">
			
			<c:if test="${!empty airReserve.airDateED}">
				<input type="hidden" name="airLineED" value="${airReserve.airLineED}">
				<input type="hidden" name="airNumberED" value="${airReserve.airNumberED}">
				<input type="hidden" name="airStartTimeED" value="${airReserve.airStartTimeED}">
				<input type="hidden" name="airEndTimeED" value="${airReserve.airEndTimeED}">
				<input type="hidden" name="airStartED" value="${airReserve.airStartED}">
				<input type="hidden" name="airArriveED" value="${airReserve.airArriveED}">
				<input type="hidden" name="airDateED" value="${airReserve.airDateED}">
				<input type="hidden" name="addEndSeatNum">
			</c:if>
			<input type="hidden" name="airLevelED" value="0">
			<button type="submit" style="display: none;" class="payComplete"></button>
		</form>
	</div>
	<script src="/resources/js/air/airSelectGrade.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>