<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style>

        .content-wrap {
          width: 1200px;
          margin: 0 auto;
          padding-top: 100px;
          background-color: antiquewhite;
        }
        .hostel-optionList{

          margin:  0 auto;
          background-color: rgb(250, 215, 247);

        }
        .hostel-header{
          margin-bottom: 10px;
        }
        .search-optionbox{
          display: flex;

          justify-content: center;

          width: 80%;
          margin:  0 auto;
          margin-top: 10px;
          margin-bottom: 10px;
        }
        .optionList-box{
          display: flex;
          flex-direction: column;
          justify-content: center;

          width: 80%;
          margin:  0 auto;
        }
        .optionList{
          display: flex;
     
          border: 1px solid grey;
          margin-bottom: 10px;
        }
        .hostel-info{
        
          margin: 0 auto;
          min-height: 400px;
          background-color: wheat;
        }
        .option-img{
          width: 30%;
        }
        .option-text{
          display: flex;
          width: 50%;
          flex-direction: column;
          justify-content: center;
        }
        .option-text > div{
        }
        .option-btn{
          display: flex;
          width: 20%;
          justify-content: center;
          align-items: center;

        }
        
      </style>
    </head>

    <body>
      <jsp:include page="/WEB-INF/views/common/header.jsp" />
      <div class="content-wrap">
        <div class="hostel-content">
          <div class="hostel-header">
            <h2>${hostel.hostelName }</h2>
            ${hostel.hostelScore }
            <hr>
            <span>${hostel.hostelAddress }</span><span>체크인/체크아웃 : ${hostel.checkinOut }</span>

          </div>
          <div class="hostel-img">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"   aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"         aria-label="Slide 3"></button>
              </div>

              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="/resources/upload/hostel/${fileList[0].filepath }" class="d-block w-100" width="800" height="600" alt="...">
                </div>
                <c:forEach items="${fileList }" var="HostelFile" begin="1">
                  <div class="carousel-item">
                    <img src="/resources/upload/hostel/${HostelFile.filepath }" class="d-block w-100" width="800"  height="600" alt="...">
                  </div>
                </c:forEach>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>

          </div>
        </div>
      <div class="hostel-optionList">
        <div class="search-optionbox">
          <input type="hidden" id="searchHostelCode" value="${hostel.hostelCode}">
          <input type="text" id="datepicker1" name="startDate" class="datepicker form-control" required  id = "datepicker1" style="width:20%; display: inline;" value="${startDate }">
            <input type="text" id="datepicker2" name="endDate" class="datepicker form-control"   required id = "datepicker2" style="width:20%; display: inline;" value="${endDate}">
            <input type="number" id="customerNum" min="1" name="customerNum" class="form-control" required  style="width:22%; display: inline;"  value="${customerNum}">
            <button type="button" id="reSearch"  class="btn btn-outline-info">재검색하기</button><!--아작스처리-->
        </div>
      
        <div class="optionList-box">
 <!-- 아작스로 불러온 옵션리스트 들어갈 자리 -->

        </div>
      </div>
      <div class="hostel-info">
        <div class="hostel-intro">     
           소개 : ${hostel.hostelIntro }
            </div>
        <div class="hostel-usage">
          안내 : ${hostel.hostelUsage }
        </div>
        <div class="hostel-comfort">
          <span><h4>편의시설</h4> </span><span>${hostel.hostelComfort }</span></div>
        <div class="hostel-service"><span><h4>서비스</h4></span><span> ${hostel.hostelService }</span></div>
      </div>
      <div class="hostel-review"><h3>리뷰탭</h3></div>
      </div>
    </div>


	<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<!--현재페이지 title이랑 header사이에 넣으면 아래 cdn로드 후 header에 있는 jquery가 다시로드되면서 datepicker사용불가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="/resources/js/hostel/hostelDetail.js"></script>
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </body>

    </html>