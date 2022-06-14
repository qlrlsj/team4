<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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
	.star{
        width: 80px;
        height: 15px;
    }
	.atag{
		color: #383d40;
		text-decoration: none;
	}
	.atag:hover{
		color: #383d40;
		text-decoration: none;
	}
	.card-body-top>p{
		margin-bottom: 0;
	}
	.card-body-bottom{
		display: flex;
		vertical-align: bottom;
	}
	.optPrice{
		color: #8e8e8e;
		text-decoration: line-through;
		flex-grow: 1;
		vertical-align: bottom;
	}
	.optDiscountPrice{
		flex-grow: 1;
		vertical-align: bottom;
	}
	.optDiscountRate{
		color: red;
		font-weight: bold;
		font-size: large;
		flex-grow: 2;
		text-align: right;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	

	<div class="div-content">
		<form action="/searchTicket.kt" class="search" style="width:35%;">
			<input type="hidden" name="type" value="optdiscountrate">
			<input type="text" class="form-control " name="searchStr" placeholder="도시나 상품을 검색해보세요" aria-label="Search" style="height: 55px;border-radius: 10px; padding-left: 95px; border: 2px solid rgb(94, 169, 235);">
		</form>

		<ul class="imgBox">
			<li class="localImg"><a href="/searchTicket.kt?searchStr=제주&type=optdiscountrate"><img src="/resources/img/ticket/제주도1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?searchStr=부산&type=optdiscountrate"><img src="/resources/img/ticket/부산1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?searchStr=서울&type=optdiscountrate"><img src="/resources/img/ticket/서울1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?searchStr=강원&type=optdiscountrate"><img src="/resources/img/ticket/강원도1.png"></a></li>
			<li class="localImg"><a href="/searchTicket.kt?searchStr=인천&type=optdiscountrate"><img src="/resources/img/ticket/인천1.png"></a></li>
		</ul>

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

		<h2 style="font-weight: bolder; margin-top:50px; margin-bottom: 20px; text-align: center;">초특가 할인순</h2>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="justify-content: center;">
					<c:forEach items="${mTicket}" var="mt">
						<div class="col" style="width: 295px;">
							<a class="atag" href="/ticketView.kt?ticketNo=${mt.getTicketNo()}">
								<div class="card shadow-sm">
									<img src="/resources/upload/ticket/${mt.getTicketFilepath1()}" class="card-img-top" alt="..." style="height: 180px;">
									<div class="card-body" style="padding-top: 7px; height: 160px;">
										<div class="card-body-top" style="height:110px">
											<p style="margin-bottom: 4px;">${mt.getParentCategoryName()} / ${mt.getParentLocalName()}</p>
											<p style="font-weight: bold;">[${mt.getLocalName()}] ${mt.getTicketTitle()}</p>
											<c:choose>
												<c:when test="${mt.getTicketScore() eq 0}">
													<img class="star" src="/resources/img/ticket/별0.png">
												</c:when>
												<c:when test="${mt.getTicketScore() gt 0}">
													<img class="star" src="/resources/img/ticket/별1.png">
												</c:when>
												<c:when test="${mt.getTicketScore() gt 1}">
													<img class="star" src="/resources/img/ticket/별2.png">
												</c:when>
												<c:when test="${mt.getTicketScore() gt 2}">
													<img class="star" src="/resources/img/ticket/별3.png">
												</c:when>
												<c:when test="${mt.getTicketScore() gt 3}">
													<img class="star" src="/resources/img/ticket/별4.png">
												</c:when>
												<c:when test="${mt.getTicketScore() gt 4}">
													<img class="star" src="/resources/img/ticket/별5.png">
												</c:when>
											</c:choose>
											<span>(0)</span>
										</div>
										<div class="card-body-bottom">
											<div class="optPrice">${mt.getOptPrice()}원</div>
											<div class="optDiscountPrice">${mt.getOptDiscountPrice()}원</div>
											<div class="optDiscountRate">${mt.getOptDiscountRate()}%</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(document).ready(function () {
		
		});
	</script>
</body>
</html>