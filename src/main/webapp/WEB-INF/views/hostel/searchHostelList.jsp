<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회결과</title>
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

.contentDiv{
 width: 80%;
 height: 1200px;
 background-color: antiquewhite;
 margin: 0 auto;
}
.filter-wrap{
width: 25%;
height: 1000px;
background-color: rgb(218, 167, 100);
padding-top: 20px;
float: left;
}
.search-list{
	width: 75%;
	background-color: rgb(247, 164, 164);
	height: 1000px;
	float: left;
}

.typeSelectWrap{
	width: 80%;
margin: 0 auto;
padding-top: 10PX;
margin-bottom: 20px;
}
.selectType{
	width: 100%;
}
.typeSelectWrap{

	height: 200px;
	background-color: antiquewhite;
}
.facility{
	background-color: rgb(152, 185, 247);
	margin-left: 10px;
}
</style>
</head>
<body>	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

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
				<input type="text" class="form-control" name="searchKeyword" required placeholder="지역/숙소이름" style="width:22%; display: inline;" value="${searchKeyword}" >
				<input type="text" name="startDate" class="datepicker form-control" required  id = "datepicker1" style="width:22%; display: inline;" value="${startDate}">
				<input type="text" name="endDate" class="datepicker form-control"   required id = "datepicker2" style="width:20%; display: inline;" value="${endDate}">
				<input type="number" name="customerNum" class="form-control" required placeholder="인원" style="width:22%; display: inline;" value="${customerNum }">
				<button type="submit" class="btn btn-outline-info">검색하기</button>
			</div>
		</div>
		</form>
	
		
	</div>


<div class="contentDiv">
	<div class="filter-wrap">
		<div class="typeSelectWrap">
			<nav class="nav flex-column">
				<a class="nav-link active" href="#">전체</a>
				<a class="nav-link" href="#">호텔</a>
				<a class="nav-link" href="#">게스트하우스</a>
				<a class="nav-link" href="#">펜션</a>
				<a class="nav-link" href="#">풀빌라</a>
			</nav>
		</div>
		<div class="col facility ">	<h4>시설</h4>
			<input class="form-check-input hostel-comfort" name="comfortCheck"  type="checkbox" value="수영장" id="swim">
			<label class="form-check-label" for="swim">수영장</label><br>
  
			<input class="form-check-input hostel-comfort" name="comfortCheck"  type="checkbox" value="루프탑" id="looftop">
			<label class="form-check-label" for="looftop">루프탑</label><br>
  
			<input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="헬스장" id="fitness">
			<label class="form-check-label" for="fitness">헬스장</label><br>
  
			<input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="레스토랑" id="restaurant">
			<label class="form-check-label" for="restaurant">레스토랑</label><br>
  
			  <input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="스파" id="spa">
			  <label class="form-check-label" for="spa">스파</label><br>
  
			  <input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="샤워실" id="shower">
			  <label class="form-check-label" for="shower">샤워실</label><br>
  
			  <input class="form-check-input hostel-comfort"name="comfortCheck"  type="checkbox" value="골프장" id="golf">
			  <label class="form-check-label" for="golf">골프장</label><br>
  
			  <input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="노래방" id="sing">
			  <label class="form-check-label" for="sing">노래방</label><br>
	  
			  <input class="form-check-input hostel-comfort" name="comfortCheck" type="checkbox" value="바베큐" id="barbecue">
			  <label class="form-check-label" for="barbecue">바베큐</label><br>

			  <!-- 서블렛으로 합쳐서에 넘길거 -->
				<input type="hidden" name="hostelComfort" id="hostelComfort">
			</div>
			<div class="col facility"><h4>서비스</h4>
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="라운지" id="bar">
				<label class="form-check-label" for="bar">라운지</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck"  type="checkbox" value="조식" id="breakfast">
				<label class="form-check-label" for="breakfast">조식</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck"  type="checkbox" value="무료주차" id="parking">
				<label class="form-check-label" for="parking">무료주차</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck"  type="checkbox" value="반려동물동반" id="pet">
				<label class="form-check-label" for="pet">반려동물동반 </label><br>
		
				<input class="form-check-input hostel-Service"name="serviceCheck"  type="checkbox" value="금연" id="smoking">
				<label class="form-check-label" for="smoking">금연</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="발렛파킹" id="valet">
				<label class="form-check-label" for="valet">발렛파킹</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="와이파이" id="wifi">
				<label class="form-check-label" for="wifi">와이파이</label><br>
		
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="룸서비스" id="roomservice">
				<label class="form-check-label" for="roomservice">룸서비스</label><br>
		  
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="장애인편의시설" id="facility">
				<label class="form-check-label" for="facility">장애인편의시설</label><br>
		  
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="짐보관" id="carrier">
				<label class="form-check-label" for="carrier">짐보관</label><br>
		  
				<input class="form-check-input hostel-Service" name="serviceCheck" type="checkbox" value="셔틀" id="shuttle">
				<label class="form-check-label" for="shuttle">셔틀</label><br>

				<!-- 서블렛으로 합쳐서에 넘길거 -->
				<input type="hidden" name="hostelService" id="hostelService">
					</div>


	</div>
	<div class="range">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
			<label class="form-check-label" for="inlineRadio1">가격순</label>
		  </div>
		  <div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2">평점순</label>
		  </div>
		  <div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" >
			<label class="form-check-label" for="inlineRadio3">3 (disabled)</label>
		  </div>
	</div>
	
	<div class="search-list">
		<div>
			<table border="1">
				<tr>
					<th>번호</th><th>제목</th><th>주소/가격</th><th>평점</th><th>파일</th>
				</tr>
				<c:forEach items="${list }" var="hostel">
				
				<tr>
					<td>${hostel.hostelCode }</td><!--히든-->
					<td><a href="/hostelDetail.kt?hostelCode=${hostel.hostelCode }&startDate=${startDate}&endDate=${endDate}&customerNum=${customerNum}">${hostel.hostelName }</a></td>
					<td>주소 : ${hostel.hostelAddress }<br>
					가격 : ${hostel.hostelPrice}</td>
					<td>${hostel.hostelScore }</td>
					<td><img src="/resources/upload/hostel/${hostel.hostelfilepath }" style="width: 200px; height: 200px;" ></td>
				</tr>	
				</c:forEach>
			</table>
		
		</div>
	</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/js/hostel/searchHostelList.js"></script>


</body>
</html>