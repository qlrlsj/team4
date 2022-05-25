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
	.selectmenu{
		height:100px;
	}
	.selectmenu>*{
		align-self: center;
	}
	tr .btn-warning{
		color:#fff;
	}
	td{
		text-align: center;
	}
	.btn-check{
		width:10%;
	}
	.modal>.modal-dialog{
		width:600px;
		max-width:600px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-content">
		
		<div class="p-3 mb-5" style="background-color:#9DEBA4">
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
		<div class="mb-5" style="width: 100%; height:500px; background-color: #B5D9E8">
			<div style="float: left; width: 50%; height:100%;">
				<div class="mb-2" style="width: 100%; height:40px;">
					
				</div>
				<table class="table" style="width: 100%; height: calc( 100% - 40px );">
					<thead>
						<tr>
							<th scope="col">항공사</th>
							<th scope="col">출발시간</th>
							<th scope="col">도착시간</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="float: left; width: 50%;">
				<div class="mb-2">
					
				</div>
			</div>
		</div>
		
	</div>
	<script>
		$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년'
		});

		function startSelect(obj){
			$(".airStart").val($(obj).children().text());
			$(".btn-close").trigger("click");
			overlapCheck();
		}
		function EndSelect(obj){
			$(".airEnd").val($(obj).children().text());
			$(".btn-close").trigger("click");
			overlapCheck();
		}
		function overlapCheck(){
			if($(".airStart").val()==$(".airEnd").val()){
				alert("출발지와 도착지가 같습니다.");
				$(".airStart").val("");
				$(".airEnd").val("");
			}
		}
		function howtoway(num){
			if(num==0){
				$(".comback").hide();
			}else{
				$(".comback").show();
			}
		}
		$(function(){
		    $(".datepicker").datepicker({minDate:0});
		    
		})
		function call()	{
		    var ar1 = $(".goDate").val().split('-');
		    var ar2 = $(".comDate").val().split('-');
		    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		    var dif = da2 - da1;
		    if(dif<0){
		    	alert("가는 날과 오는 날의 날짜를 확인해주세요.");
				$(".goDate").val("");
				$(".comDate").val("");
		    }
		}
		 $(".goDate").change(function(){
			 call();
		 })
		 $(".comDate").change(function(){
			 call();
		 })
		 $(".amount").change(function(){
			 if($(this).val()>8||$(this).val()<1){
				 alert("잘못된 입력입니다.");
				 $(this).val(1);
			 }
		 })
		  
// 		function searchStartPlace(){
// 			$.ajax({
// 				url:"/allAirSchedule.kt",
				
// 				success: function(list){
// 					console.log("성공");
// 				}
// 			});
// 		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>