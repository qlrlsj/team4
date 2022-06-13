<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul, li{
		list-style-type: none;
	}
	.imgBox{
		overflow: hidden;
		padding-left: 50px;
		margin-bottom: 75px;
	}
	.localImg{
		float: left;
		margin: 0 17px;
	}
	.imgBox img{
		width: 180px;
		height: 110px;
		border-radius: 10px;
	}
	.ticketImgSize{
		width: 100%;
		height: 100%;
	}
	.search{
		margin: 50px auto;
		
	}
	.searchIcon{
		display: inline-block;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/ticket/이벤트1.PNG" class="d-block w-100 ticketImgSize" alt="프로모션1">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/ticket/이벤트2.PNG" class="d-block w-100 ticketImgSize" alt="프로모션2">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/ticket/이벤트3.PNG" class="d-block w-100 ticketImgSize" alt="프로모션3">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/ticket/이벤트4.PNG" class="d-block w-100 ticketImgSize" alt="프로모션4">
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
	<div class="div-content">
		<form class="search" style="width:35%;">
			<input type="search" class="form-control " placeholder="도시나 상품을 검색해보세요" aria-label="Search" style="height: 55px;border-radius: 10px; padding-left: 95px; border: 2px solid rgb(94, 169, 235);">
		</form>

		<ul class="imgBox">
			<li class="localImg"><a href="/searchTicket.kt?localName=제주도"><img src="/resources/img/ticket/제주도1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?localName=부산"><img src="/resources/img/ticket/부산1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?localName=서울"><img src="/resources/img/ticket/서울1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?localName=강원도"><img src="/resources/img/ticket/강원도1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?localName=인천"><img src="/resources/img/ticket/인천1.png"></a></li>
		</ul>

		
		<h2 style="font-weight: bolder; margin-top:30px">BEST 상품(판매)</h2>
		<div class="card" style="width: 18rem;">
			<img src="/resources/upload/ticket/서핑_1.PNG" class="card-img-top" alt="...">
			<div class="card-body">
			  <div>
				  <span></span>
			  </div>
			</div>
		  </div>
	</div>
	
	<h2>ticketMain</h2>
		<a href="/insertTicketForm.kt">티켓상품 등록하기</button>
		<a href="/ticketView.kt?ticketNo=1">티켓 상세보기</a>
		<a href="/insertTest.kt">test</a>

	


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(document).ready(function () {
		
		});
	</script>
</body>
</html>