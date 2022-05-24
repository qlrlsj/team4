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
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<div class="div-content">
		
		<div class="p-3 mb-5 bg-secondary">
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				 <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="howtoway(0)">
				 <label class="btn btn-outline-success" for="btnradio1">편도</label>
				 <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="howtoway(1)" checked>
				 <label class="btn btn-outline-success" for="btnradio2">왕복</label>
			</div>
			<form>
				<fieldset>
					<div class="row selectmenu">
						<!--출발지선택 -->
						<div class="col">
							<input type="text" class="form-control airStart" placeholder="출발지선택" data-bs-toggle="modal" data-bs-target="#selectStartModal" disabled>						
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
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">인천</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">김포</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">양양</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">무안</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">제주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">대구</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">청주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">김해</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">울산</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">여수</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">광주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">군산</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">원주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">포항</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="startSelect(this);">사천</button></td>
												</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--도착지선택 -->
						<div class="col">
							<input type="text" class="form-control airEnd" placeholder="도착지선택" data-bs-toggle="modal" data-bs-target="#selectEndModal" disabled>						
						</div>
						<div class="modal fade" id="selectEndModal" tabindex="-1" aria-labelledby="airEndLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="airEndLabel">출발지 선택</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="table">
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">인천</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">김포</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">양양</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">무안</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">제주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">대구</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">청주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">김해</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">울산</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">여수</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">광주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">군산</button></td>
												</tr>
												<tr>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">원주</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">포항</button></td>
													<td scope="col"><button type="button" class="btn btn-warning" onclick="EndSelect(this);">사천</button></td>
												</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--가는날짜선택 -->
						<div class="col">
							<input type="text" class="datepicker form-control goDate" placeholder="가는 날 선택">
						</div>
						<!--오는날짜선택 -->
						<div class="col comback">
							<input type="text" class="datepicker form-control comDate" placeholder="오는 날 선택">						
						</div>
						<!--인원수선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="인원수">						
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
			$(".airStart").val($(obj).text());
			$(".btn-close").trigger("click");
			overlapCheck();
		}
		function EndSelect(obj){
			$(".airEnd").val($(obj).text());
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
		    $(".datepicker").datepicker();
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