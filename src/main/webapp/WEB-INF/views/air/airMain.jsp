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
		
		<div class="p-3 mb-5 bg-secondary">
			<form>
				<fieldset>
					<div class="row">
						<!--출발지선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="출발지선택" onclick="searchStartPlace();" data-bs-toggle="modal" data-bs-target="#selectStartModal">						
						</div>
						<div class="modal fade" id="selectStartModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">출발지 선택</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">선택</button>
										<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!--도착지선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="도착지선택">						
						</div>
						<!--가는날짜선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="가는 날 선택">						
						</div>
						<!--오는날짜선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="오는 날 선택">						
						</div>
						<!--인원수선택 -->
						<div class="col">
							<input type="text" class="form-control" placeholder="인원수">						
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	function searchStartPlace(){
		$.ajax({
			url:"/allAirSchedule.kt",
			page: 0,
			perPage: 0,
			totalCount: 0,
			currentCount: 0,
			matchCount: 0,
			data:{
		      	항공사: string,
		      	편명: string,
		     	출발공항: string,
		      	도착공항: string,
		      	출발시간: string,
		      	도착시간: string,
		      	운항요일: string,
		     	시작일자: string,
		      	종료일자: string,
		      	기종: string
				}
			success: function(list){
				$("[name=receiver]").empty();
				for(let i=0;i<list.length;i++){
					const option = $("<option>");
					option.append(list[i]);
					$("[name=receiver]").append(option);
				}
				$("#sendDm-modal").css("display","flex");
			}
		});
	}
</script>
</html>