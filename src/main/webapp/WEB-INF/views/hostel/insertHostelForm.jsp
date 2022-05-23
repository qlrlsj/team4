<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostel insert</title>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<h1>숙소등록하기</h1>
	<h3>분류</h3>
	<div class="hostel-type">
		<select id="hostelType" class="form-select hostel-type-select" aria-label="Default select example" style="width: 30%;">
			<option selected>객실종류를 선택하세요</option>	<!--이옵션 선택되는지 나중에 확인-->
			<option value="1">호텔</option>
			<option value="2">게스트하우스</option>
			<option value="3">펜션</option>
			<option value="4">풀빌라</option>
		</select>
	</div>
	<h3>내용</h3>
	<div class="hostel-content from-group">
		제목 : <input type="text" placeholder="검색용제목" name="hostelName"><br>
		예약 가능 기간(시작일) : <input type="text" name="bookStart" class="datepicker form-control"  id = "datepicker1" style="width:30%;"><br> <!-- 오늘보다 이전날짜는 비활성화-->
		예약 가능 기간(종료일) : <input type="text" name="bookEnd" class="datepicker form-control" id = "datepicker2"  style="width:30%;"><br>
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

	<h3>옵션선택</h3>
	<div class="hostel-option">
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


	<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<!--현재페이지 title이랑 header사이에 넣으면 아래 cdn로드 후 header에 있는 jquery가 다시로드되면서 datepicker사용불가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css' rel='stylesheet' type='text/css'>
<script src='bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js' type='text/javascript'></script>
<!-- 한국어 적용  -->
<!-- <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script> -->




	
	<script>
		
	$(document).ready(function(){
// 		 날짜선택옵션
	 $('#datepicker1').datepicker();
	 $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
    $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
    $("#datepicker2").datepicker( "option", "minDate", selectedDate );
    });// 종료일이 시작일보다 빠르게 선택하는것 막기

    $('#datepicker2').datepicker();
    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
    $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
    });


		});
   





	$("#hostelType").on("change",function(){ // 숙소 타입에 따라 옵션창 바꿔주기 
		const hostelType = $(this).val(); 
// 		console.log(new Date());
		console.log(hostelType);
		$(".select-option").hide();	// 다 숨기고 선택한 옵션에 해당하는거만 보여주기 
		if(hostelType==1){
			$("#select-option1").show();
		}else if(hostelType==2){
			$("#select-option2").show();
		}else if(hostelType==3){
			$("#select-option3").show();
		}else if(hostelType==4){
			$("#select-option4").show();
		}

	});
	


	</script>

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>