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
.center{
	margin : 10px auto;
}
.ex{
	align-content:center;
}
.sbm{
 	margin-top : 20px;  
 	float: right; 
 	width: 150px; 
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
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
    
    function checkForm(){
		if($('#companionTitle').val() == ''){
			alert("제목을 입력해주세요!");
			return false;
		}
		if($('#companionField').val() == null){
			alert("여행 지역을 입력해주세요!");
			return false;
		}
		if($('#datepicker1').val() == ''){
			alert("여행 시작 예정일을 입력해주세요!");
			return false;
		}
		if($('#datepicker2').val() == ''){
			alert("여행 시작 예정일을 입력해주세요!");
			return false;
		}
		if($('#theme').val() == null){
			alert("여행 테마를 입력해주세요!");
			return false;
		}
		if($('#summernote').val() == ''){
			alert("글 내용을 입력해주세요!");
			return false;
		}
    }
	</script>
	<form method="post" action="/companionInsert.kt"  onsubmit="return checkForm()">	
		<div class="div-content center">
		  <div class="div-content mb-3">
		    <label for="companionTitle" class="form-label">글 제목</label>
		    <input type="text" class="form-control" name="companionTitle" id="companionTitle" >
		  </div>
		  <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		  <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		<div class="div-content p-3 mb-5 row ex">
			<select class="form-select col comS" name="companionField" id="companionField">
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
			 <input class="col comS" type="text" name="travleStart"  id="datepicker1" placeholder="여행 시작일">
			 <input class="col comS" type="text" name="travleEnd"  id="datepicker2" placeholder="여행 종료일">
		     <select class="form-select col comS" name="companionTheme" id="theme">
		     	<option value="" disabled selected>여행테마</option>
		     	<option value="선택 안함">선택 안함</option>
		     	<option value="맛집 탐방">맛집 탐방</option>
		     	<option value="관광지">관광지</option>
		     	<option value="액티비티">액티비티</option>
		     </select>
	     </div>	
	     <div class="div-content">
		 	 <textarea id="summernote" name="companionContent"></textarea>
		 	 <button class="sbm btn btn-primary btn-lg com-plus" type="submit" id="comSubmit">작성</button>
	     </div>
	  </div>	  
	</form>
	<script>
// 	function dateSum(){
// 		const dateStart = $('#datepicker1').val();
// 		const dateEnd = $('#datepicker2').val();
// 		const trableDate = dateStart +" ~ "+ dateEnd;
// 		$('[name=trableDate]').val(trableDate);
// 	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>