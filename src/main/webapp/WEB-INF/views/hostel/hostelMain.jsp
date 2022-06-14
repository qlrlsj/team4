<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostel Main</title>
<style>
.content-wrap{
width: 100%;
	}
.search-box{
	width: 80%;
	height: 150px;
	background-color: rgba(241, 243, 248, 0.808);
	margin: 0 auto;
	border-radius: 10px;
	margin-top: 5px;
}
.type-btn{
	min-width: 1200px;
	padding-top: 20px;
	padding-left: 20px;
	
}
.search-content{
	margin: 20px; 
	min-width: 810px;
}
.Hostel-List{
	width: 80%;
	height: 1200px;

	margin: 0 auto;
	margin-top: 30px;
}
.Hostel-List>div{
width: 100%;
height: 400px;
}
.hostel-list-one{
	width: 49%;
	height: 90%;

}
.list-left{
	float: left;
	margin-left: 5px;
}
.list-right{
	margin-left: 10px;
	display: inline-block;
}

.list-img{
	margin: 0 auto; 
	width: 400px;
	padding-top: 10px;
	margin-bottom: 10px;
}
.list-img>img{
	border-radius: 4px;
}
.list-title{
	width: 400px;
	margin: 0 auto;
	text-align: center;
	padding-top: 1px;
	font-size: 20px;
	color: rgb(34, 34, 34);

}
.list-title>a{
	text-decoration: none;
	color: rgb(82, 82, 94);
}
.best-list{
	margin-bottom: 30px;
}
.lowPrice-list{
	margin-bottom: 30px;
}
.reserveInfo{
	width: 100px;
	margin: 0 auto;
	font-size: 25px;
}
.reserveInfo>a{
	color: black;
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!--<div>	<a href="/insertHostelForm1.kt">숙소 등록하기 </a></div>-->
<div class="content-wrap">
	<form class="form-inline" action="/searchHostelList.kt" method="post">
	<div class=" type-btn search-box  " style="min-width: 850px;">
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="roomType" id="btnradio1" value="1" required autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio1">호텔</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio2"  value="2" required autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio2">게스트하우스</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio3"   value="3" required autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio3">펜션</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio3"  value="4" required autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio4">풀빌라</label>
		  </div>

		<div class="search-content ">
			<input type="text" class="form-control" name="searchKeyword" required placeholder="지역/숙소이름" style="width:22%; display: inline;" >
			<input type="text" name="startDate" class="datepicker form-control" required  id = "datepicker1" style="width:22%; display: inline;" placeholder="입실날짜">
			<input type="text" name="endDate" class="datepicker form-control"   required id = "datepicker2" style="width:20%; display: inline;" placeholder="퇴실날짜">
			<input type="number" name="customerNum" min="1"class="form-control" required placeholder="인원" style="width:22%; display: inline;" >
			<button type="submit" class="btn btn-outline-info">검색하기</button>
		</div>
	</div>
	</form>
	<div class="Hostel-List" style="min-width: 850px;">
		<div class="best-list" >
			<h4>인기숙소</h4>
			<hr>
			<div class="hostel-list-one list-left ">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/0d6bf225-70ed-494e-86db-f217e45ad5bd-1000_1.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=81&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">롯데호텔 부산</a></div>
			</div>
			<div class="hostel-list-one list-right">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/상상마당a_2.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=74&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">상상마당 춘천</a></div>

			</div>
			
		</div>
		<div class="lowPrice-list" >
			<h4>특가</h4>
			<hr>
			<div class="hostel-list-one list-left">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/라마다1.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=102&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">여수 라마다</a></div>

			</div>
			<div class="hostel-list-one list-right">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/제주리젠트마린.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=107&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">제주 리젠트마린</a></div>

			</div>


		</div>
		<div class="lastRoom-list" >
			<h4>매진임박</h4>
			<hr>
			<div class="hostel-list-one list-left">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/산티아고.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=105&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">제주 산티아고 게스트하우스</a></div>

			</div>
			<div class="hostel-list-one list-right">
				<div class="list-img shadow" >
					<img width="400px" height="300px" src="/resources/upload/hostel/f7b7d6d9-1206-1557-b8b3-c218e79f0de6-1000_1.jpg" alt="">
				</div>
				<div class="list-title"><a href="/hostelDetail.kt?hostelCode=60&startDate=2022-06-16&endDate=2022-06-20&customerNum=2">글래드 마포</a></div>

			</div>

		</div>
	</div>
	

</div>
<!--
<div class="reserveInfo">
<a href="/searchReserveInfo.kt">예약조회</a>
</div>-->
	<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<!--현재페이지 title이랑 header사이에 넣으면 아래 cdn로드 후 header에 있는 jquery가 다시로드되면서 datepicker사용불가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 -->
	<script src="/resources/js/hostel/hostelMain.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>