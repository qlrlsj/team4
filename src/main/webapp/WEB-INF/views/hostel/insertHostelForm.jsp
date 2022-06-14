<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostel insert</title>
<style>


.hostel-service,.hostel-facilities {
width: 40%;
float: left;!important

}

.insert-form-wrap{
	width: 90%;
	margin: 0 auto;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="insert-form-wrap">
	<h3>분류</h3>
	<div class="hostel-type">
		<select id="hostelType" class="form-select hostel-type-select" aria-label="Default select example" style="width: 30%;">
			<option selected disabled>객실종류를 선택하세요</option>	<!--이옵션 선택되는지 나중에 확인-->
			<option value="1">호텔</option>
			<option value="2">게스트하우스</option>
			<option value="3">펜션</option>
			<option value="4">풀빌라</option>
		</select>
	</div>
	<h3>내용</h3>
	<div class="hostel-content from-group">
		제목  <input type="text" placeholder="검색용제목" class=" form-control"name="hostelName" style="width:30%;"><br>
		예약 가능 기간(시작일)  <input type="text" name="bookStart" class="datepicker form-control"   id = "datepicker1" style="width:30%;"><br> <!-- 오늘보다 이전날짜는 비활성화-->
		예약 가능 기간(종료일)  <input type="text" name="bookEnd" class="datepicker form-control" id = "datepicker2"  style="width:30%;"><br>
		체크인 체크아웃시간 : <input type="text" name="checkinOut" placeholder="(ex 15:00/12:00)"><br>
		숙소소개<br>
		<textarea class="form-control" name="hostelIntro" rows="10" style="width: 50%;"></textarea><br>
		<label for="exampleTextarea">이용안내/유의사항</label>
		<textarea class="form-control" name="hostelUsage" id="hostelUsage"  rows="10"  style="width: 50%;"></textarea>
	</div>
	<div>
		<h3>사진</h3>
		<!--사진 등록하면 미리보기 띄우기 -->

	</div>
	<div class="hostel">
		<h3>위치</h3>
	
		<input type="text" class="" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" class="" id="sample6_address" placeholder="주소"><br>
		<input type="text"  class="" id="sample6_detailAddress" onchange="full_address()"placeholder="상세주소">
		<input type="text" class="" id="sample6_extraAddress"  placeholder="참고항목"><br>
				<!-- 서블릿에는 상세주소까지 합쳐서 보내주기용 히든 인풋 -->
				<input type="hidden" name="hostelAddress" id="hostelAddress">
	</div>

	<div class="facility-option">
	<div class="hostel-facilities ">
		<h3>시설</h3>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="1" id="swim">
		  <label class="form-check-label" for="swim">수영장 </label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="2" id="looftop">
		  <label class="form-check-label" for="looftop">루프탑 </label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="3" id="fitness">
		  <label class="form-check-label" for="fitness">헬스장 </label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="4" id="restaurant">
		  <label class="form-check-label" for="restaurant">레스토랑 </label><br>

			<input class="form-check-input hostel-comfort" type="checkbox" value="5" id="spa">
			<label class="form-check-label" for="spa">스파/월풀 </label><br>

			<input class="form-check-input hostel-comfort" type="checkbox" value="6" id="shower">
			<label class="form-check-label" for="shower">샤워실</label><br>

			<input class="form-check-input hostel-comfort" type="checkbox" value="7" id="golf">
			<label class="form-check-label" for="golf">골프장 </label><br>

			<input class="form-check-input hostel-comfort" type="checkbox" value="8" id="sing">
			<label class="form-check-label" for="sing">노래방 </label><br>
	
			<input class="form-check-input hostel-comfort" type="checkbox" value="9" id="barbecue">
			<label class="form-check-label" for="barbecue">바베큐 </label><br>
	
			<input class="form-check-input hostel-comfort" type="checkbox" value="10" id="souna">
			<label class="form-check-label" for="souna">사우나 </label><br>
	
			<input class="form-check-input hostel-comfort" type="checkbox" value="11" id="seminar">
			<label class="form-check-label" for="seminar">세미나 </label><br>
		
		
			  <input class="form-check-input hostel-comfort" type="checkbox" value="12" id="convini">
			  <label class="form-check-label" for="convini">매점</label><br>
	
			
			  <input class="form-check-input hostel-comfort" type="checkbox" value="13" id="kitchen">
			  <label class="form-check-label" for="kitchen">공용주방</label><br>
	
		
			  <input class="form-check-input hostel-comfort" type="checkbox" value="14" id="football">
			  <label class="form-check-label" for="football">축구장/풋살장 </label><br>
	
	
			  <input class="form-check-input hostel-comfort" type="checkbox" value="15" id="cafe">
			  <label class="form-check-label" for="cafe">까페</label><br>

			<!-- 서블렛으로 합쳐서에 넘길거 -->
			  <input type="hidden" name="hostelComfort" id="hostelComfort">
	
	
	</div>
	<div class="hostel-service  ">
		<h3>서비스</h3>
		<input class="form-check-input hostel-comfort" type="checkbox" value="1" id="bar">
		<label class="form-check-label" for="bar">바/라운지 </label><br>

		<input class="form-check-input hostel-comfort" type="checkbox" value="2" id="breakfast">
		<label class="form-check-label" for="breakfast">조식 </label><br>

		<input class="form-check-input hostel-comfort" type="checkbox" value="3" id="parking">
		<label class="form-check-label" for="parking">무료주차 </label><br>

		<input class="form-check-input hostel-comfort" type="checkbox" value="4" id="pet">
		<label class="form-check-label" for="pet">반려동물동반 </label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="5" id="smoking">
		  <label class="form-check-label" for="smoking">금연 </label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="6" id="valet">
		  <label class="form-check-label" for="valet">발렛파킹</label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="7" id="wifi">
		  <label class="form-check-label" for="wifi">와이파이</label><br>

		  <input class="form-check-input hostel-comfort" type="checkbox" value="8" id="roomservice">
		  <label class="form-check-label" for="roomservice">룸서비스 </label><br>
  
		  <input class="form-check-input hostel-comfort" type="checkbox" value="9" id="facility">
		  <label class="form-check-label" for="facility">장애인편의시설 </label><br>
  
		  <input class="form-check-input hostel-comfort" type="checkbox" value="10" id="carrier">
		  <label class="form-check-label" for="carrier">짐보관 </label><br>
  
		  <input class="form-check-input hostel-comfort" type="checkbox" value="11" id="shuttle">
		  <label class="form-check-label" for="shuttle">셔틀 </label><br>
	  
	  		<input class="form-check-input hostel-comfort" type="checkbox" value="12" id="pickup">
			<label class="form-check-label" for="pickup">픽업</label><br>
  			<!-- 서블렛으로 합쳐서에 넘길거 -->
			  <input type="hidden" name="hostelService" id="hostelService">

	</div>
	</div>

	
	<div class="hostel-option" style="width: 80%;"  >
		<h3>옵션선택</h3>
		<div class="select-option" id="select-option1" style="display: none;">
			호텔옵션선택
		</div>
		<div class="select-option" id="select-option2" style="display: none;">
			게하옵션선택
		</div>
		<div class="select-option" id="select-option3" style="display: none;">
			펜션옵션선택
		</div>
		<div class="select-option" id="select-option4" style="display: none;">
			풀빌라옵션선택
		</div>
	</div>

</div>


	<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<!--현재페이지 title이랑 header사이에 넣으면 아래 cdn로드 후 header에 있는 jquery가 다시로드되면서 datepicker사용불가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--다음주소api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/insertHostel.js"></script>


	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>