<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/index.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="div-content">
		<div class="MainDiv" style="background-color: azure;">
			<div class="MainLogo">
				<h2 class="MainH2">비행기는 타봤냐?</h2>
				<div class="ShortcutDiv">
					<div class="Shortcut">
						항공권 바로가기
					</div>
					<div class="material-symbols-outlined ShortcutIcon" type="button">
						arrow_circle_right
					</div>
				</div>
			</div>
			<div id="airExampleControls" class="carousel slide ImgBox" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/upload/air/air_p1.png" class="d-block w-100 ImgSize" alt="프로모션1">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/air/air_p2.png" class="d-block w-100 ImgSize" alt="프로모션2">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/air/air_p3.png" class="d-block w-100 ImgSize" alt="프로모션3">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#airExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#airExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="MainDiv" style="background-color: lavenderblush;">
			<div class="MainLogo">
				<h2 class="MainH2">우리 어디서자? 노숙해?</h2>
				<div class="ShortcutDiv">
					<div class="Shortcut">
						숙소 바로가기
					</div>
					<div class="material-symbols-outlined ShortcutIcon" type="button">
						arrow_circle_right
					</div>
				</div>
			</div>
			<div id="hostelExampleControls" class="carousel slide ImgBox" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/upload/hostel/0a806a09-d050-4660-aa38-1edaaf273f82-1000.jpg" class="d-block w-100 ImgSize" alt="프로모션1">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/hostel/10c3ac84-9bd7-4645-9513-021810923d61-1000.jpg" class="d-block w-100 ImgSize" alt="프로모션2">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/hostel/2be383e1-fab8-4725-9a63-622af3093a26-1000_2.jpg" class="d-block w-100 ImgSize" alt="프로모션3">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#hostelExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#hostelExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="MainDiv" style="background-color: rgb(255, 232, 215);">
			<div class="MainLogo">
				<h2 class="MainH2">도착했는데 우리 이제 뭐해?</h2>
				<div class="ShortcutDiv">
					<div class="Shortcut">
						티켓 바로가기
					</div>
					<div class="material-symbols-outlined ShortcutIcon" type="button">
						arrow_circle_right
					</div>
				</div>
			</div>
			<div id="ticketExampleControls" class="carousel slide ImgBox" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/upload/ticket/가평2_1.PNG" class="d-block w-100 ImgSize" alt="프로모션1">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/ticket/서핑_1.PNG" class="d-block w-100 ImgSize" alt="프로모션2">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/ticket/가평_2.PNG" class="d-block w-100 ImgSize" alt="프로모션3">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#ticketExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#ticketExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		
		<!--  -->
		
		<div class="MainDiv" style="background-color: lavenderblush;">
			<div class="MainLogo">
				<h2 class="MainH2">먹고자고놀고 한번에 !</h2>
				<div class="ShortcutDiv">
					<div class="Shortcut">
						패키지 바로가기
					</div>
					<div class="material-symbols-outlined ShortcutIcon" type="button">
						arrow_circle_right
					</div>
				</div>
			</div>
			<div id="packageExampleControls" class="carousel slide ImgBox" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/upload/package/flower1.png" class="d-block w-100 ImgSize" alt="프로모션1">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/package/flower2.png" class="d-block w-100 ImgSize" alt="프로모션2">
					</div>
					<div class="carousel-item">
						<img src="/resources/upload/package/flower3.png" class="d-block w-100 ImgSize" alt="프로모션3">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#packageExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#packageExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		
		<!--  -->
		
	</div>
	
	<script src="/resources/js/index.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript"></script>
</html>