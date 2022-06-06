<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostel insert</title>
<style>
.hostel-content{
    margin-top: 10px;
    padding: 5px;
}
.select-option{
 display: none;
}
.body div{
  margin: 20px;!important
}


</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="insert-form-wrap div-content">
        <form action="/insertHostel.kt" method="post" enctype="multipart/form-data">
      <!--    <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }" >-->
      <input type="hidden" name="memberNo" value="2" >
        <div class="container">
            <div class="row">
              <div class="col-sm hostel-type">	<h3>분류</h3> 
                <select id="hostelType" name="roomType" class="form-select hostel-type-select" aria-label="Default select example" style="width: 30%;">
                    <option selected disabled>객실종류를 선택하세요</option>	<!--이옵션 선택되는지 나중에 확인-->
                    <option value="1">호텔</option>
                    <option value="2">게스트하우스</option>
                    <option value="3">펜션</option>
                    <option value="4">풀빌라</option>
                </select>
                </div> 
            </div>

            <div class="row">
              <div class="col-sm hostel-content from-group " >	<h3>숙소정보</h3>
            	제목  <input type="text" placeholder="검색용제목" class=" form-control"name="hostelName" required style="width:30%;"><br>
		        예약 가능 기간(시작일)  <input type="text" name="bookStart" class="datepicker form-control"  required  id = "datepicker1" style="width:30%;"><br> <!-- 오늘보다 이전날짜는 비활성화-->
	        	예약 가능 기간(종료일)  <input type="text" name="bookEnd" class="datepicker form-control" required id = "datepicker2"  style="width:30%;"><br>
	        	체크인 체크아웃시간 : <input type="text" name="checkinOut" class="form-control" required style="width:30%;" placeholder="(ex 15:00/12:00)"><br><br>
                <label for="hostelIntro">숙소소개</label><br>
	        	<textarea class="summernote" required name="hostelIntro" id="hostelIntro" "></textarea><br>
	        	<label for="hostelUsage">이용안내/유의사항</label>
	        	<textarea class="summernote" required name="hostelUsage" id="hostelUsage"    "></textarea>
              
                <h5>위치</h5>
	
                <input type="text" id="sample6_postcode" class="post " style="width: 20%;" placeholder="우편번호" readonly>
                <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-info btn-sm" value="우편번호 찾기"><br>
                <input type="text" id="sample6_address" class="post " placeholder="주소" readonly  ><br>
                <input type="text" id="sample6_detailAddress" class="post " onchange="full_address()" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress"  class="post  " readonly placeholder="참고항목"><br>
                        <!-- 서블릿에는 상세주소까지 합쳐서 보내주기용 히든 인풋 -->
                        <input type="hidden" name="hostelAddress" id="hostelAddress">
              </div>
            </div>

            <div class="row">
                <div class="col-sm">	<h3>사진</h3>
                  <div class="mb-3">
                    <label for="formFile" class="form-label">사진 추가 </label>
                    <input class="form-control" type="file" id="formFile" name="upfile" required multiple style="width: 40%;">
                 
                  </div>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm">	<h3>시설/서비스</h3>
                  <hr style="width: 300px; ">
                </div>
              </div>

              <div class="row">
                <div class="col">	<h4>시설</h4>
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
                <div class="col"><h4>서비스</h4>
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
              <hr>

              <div class="row">
                <div class="col-sm hostel-option">	<!--style="display: none;-->
                    <h3>객실</h3>
                    <div class=""><h5>상단에서 객실타입을 선택하세요.</h5> </div>
                    <!--상단에서 객실타입을 선택하세요 문구만 출력 / 선택시 하단내용 출력 -->
                    <button type="button" class="btn btn-outline-primary"  id="addroom"  style="margin-bottom :10px">객실추가</button>
                    <button type="button" class="btn btn-outline-warning" id="delroom" style="margin-bottom :10px">객실삭제</button>
      
                    <div class="select-option" id="select-option1" >
<!--                         호텔옵션선택 -->
                        <table class="table hostel-option" id="hostel-option1">
                            <thead>
                              <tr>
                                <th scope="col">방이름</th>
                                <th scope="col">숙소유형</th>
                                <th scope="col">기준인원/최대인원</th>
                                <th scope="col">가격</th>
                              </tr>
                            </thead>
                            <tbody>
 
                            </tbody>
                          </table>
                    </div>
                    <div class="select-option" id="select-option2" >
<!--                         게하옵션선택 -->
                        <table class="table hostel-option" id="hostel-option2">
                          <thead>
                            <tr>
                              <th scope="col">방이름</th>
                              <th scope="col">숙소유형</th>
                              <th scope="col">기준인원/최대인원</th>
                              <th scope="col">가격</th>
                            </tr>
                          </thead>
                          <tbody>
     
                          </tbody>
                        </table>
                    </div>
                    <div class="select-option" id="select-option3" >
<!--                         펜션옵션선택 -->
                        <table class="table hostel-option " id="hostel-option3">
                          <thead>
                            <tr>
                              <th scope="col">방이름</th>
                              <th scope="col">숙소유형</th>
                              <th scope="col">기준인원/최대인원</th>
                              <th scope="col">가격</th>
                            </tr>
                          </thead>
                          <tbody>


                          </tbody>
                        </table>
                    </div>
                    <div class="select-option" id="select-option4" >
<!--                         풀빌라옵션선택 -->
                        <table class="table hostel-option" id="hostel-option4">
                          <thead>
                            <tr>
                              <th scope="col">방이름</th>
                              <th scope="col">숙소유형</th>
                              <th scope="col">기준인원/최대인원</th>
                              <th scope="col">가격</th>
                            </tr>
                          </thead>
                          <tbody>

                          </tbody>
                        </table>
                    </div>
                </div>
              </div>

          </div>

          <div class="d-grid gap-2" style="width: 100%;" >
            <button class="btn btn-lg btn-primary" type="submit"  style="width: 30%; margin: 0 auto;">등록하기</button>
          </div>



	

</form>
</div>


	<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<!--현재페이지 title이랑 header사이에 넣으면 아래 cdn로드 후 header에 있는 jquery가 다시로드되면서 datepicker사용불가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--다음주소api-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/hostel/insertHostel.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>