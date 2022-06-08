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
	background-color: rgba(228, 222, 215, 0.808);
	margin: 0 auto;
}
.type-btn{
	padding-top: 20px;
	padding-left: 20px;
	
}
.search-content{
	margin: 20px; 
}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="content-wrap">
	<form class="form-inline" action="/searchHostelList.kt" method="post">
	<div class=" type-btn search-box  " style="min-width: 850px;">
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="roomType" id="btnradio1" value="1" autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio1">호텔</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio2"  value="2" autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio2">게스트하우스</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio3"   value="3" autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio3">펜션</label>
			<input type="radio" class="btn-check" name="roomType" id="btnradio3"  value="4" autocomplete="off" checked="">
			<label class="btn btn-outline-primary" for="btnradio4">풀빌라</label>
		  </div>

		<div class="search-content ">
			<input type="text" class="form-control" name="searchKeyword" required placeholder="지역/숙소이름" style="width:22%; display: inline;" >
			<input type="text" name="startDate" class="datepicker form-control" required  id = "datepicker1" style="width:22%; display: inline;" placeholder="입실날짜">
			<input type="text" name="endDate" class="datepicker form-control"   required id = "datepicker2" style="width:20%; display: inline;" placeholder="퇴실날짜">
			<input type="number" name="customerNum" class="form-control" required placeholder="인원" style="width:22%; display: inline;" >
			<button type="submit" class="btn btn-outline-info">검색하기</button>
		</div>
	</div>
	</form>

	
</div>

</body>
</html>