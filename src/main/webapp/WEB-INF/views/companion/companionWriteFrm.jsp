<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.comS{
	margin : 0 2%;
}
select option[value=""][disabled] {
	display: none;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- datepick -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
    $(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            height: 600,
            maxHeight: 600,
            focus: false,
            lang : "ko_KR",
            
        });
		// 날짜선택옵션
	   	 $('#datepicker1').datepicker();
	   	 $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
	     $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
	     $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
	     $("#datepicker2").datepicker( "option", "minDate", selectedDate );
	     });
	     // 종료일이 시작일보다 빠르게 선택하는것 막기	
	     $('#datepicker2').datepicker();
	     $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
	     $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
	     $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
	     });	     
   	});
	</script>
	<h2>동행자 모집 글 작성</h2>
	<form method="post" action="/companionInsert.kt">	
		  <div class="mb-3">
		    <label for="companionTitle" class="form-label">제목</label>
		    <input type="text" class="form-control" name="companionTitle" id="companionTitle" >
		  </div>
		  <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		  <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		<div class="div-content p-3 mb-5 bg-secondary row">
			<select class="form-select col comS" name="companionField">
				<option value="" disabled selected>지역</option>
				<option value="선택 안함">선택 안함</option>
		    	<option value="서울">서울</option>
		        <option value="부산">부산</option>
		        <option value="대구">대구</option>
		        <option value="인천">인천</option>
		        <option value="광주">광주</option>
		        <option value="대전">대전</option>
		        <option value="울산">울산</option>
		        <option value="세종">세종</option>
		        <option value="경기도">경기도</option>
		        <option value="강원도">강원도</option>
		        <option value="충청북도">충청북도</option>
		        <option value="충청남도">충청남도</option>
		        <option value="전라북도">전라북도</option>
		        <option value="전라남도">전라남도</option>
		        <option value="경상북도">경상북도</option>
		        <option value="경상남도">경상남도</option>
		        <option value="제주">제주</option>
		     </select>
			 <input class="col comS" type="text"  id="datepicker1" placeholder="여행 시작일">
			 <input class="col comS" type="text"  id="datepicker2" placeholder="여행 종료일">
			 <input type="hidden" name="trableDate" value="">
		     <select class="form-select col comS" name="companionTheme">
		     	<option value="" disabled selected>여행테마</option>
		     	<option value="선택 안함">선택 안함</option>
		     	<option value="맛집 탐방">맛집 탐방</option>
		     	<option value="관광지">관광지</option>
		     	<option value="액티비티">액티비티</option>
		     </select>
	     </div>	
 	 <textarea id="summernote" name="companionContent"></textarea>
 	 <button type="submit" id="comSubmit" onclick="dateSum();">작성</button>
	</form>
	<script>
	function dateSum(){
		const dateStart = $('#datepicker1').val();
		const dateEnd = $('#datepicker2').val();
		const trableDate = dateStart +" ~ "+ dateEnd;
		$('[name=trableDate]').val(trableDate);
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>