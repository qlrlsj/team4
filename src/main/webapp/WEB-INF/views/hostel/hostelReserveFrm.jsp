<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostel Resere Form</title>
<style>


</style>
  <!-- jQuery -->
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
</head>
<link rel="stylesheet" href="/resources/css/hostel/hostelReserve.css">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content-wrap">
        <form action="">
		<div class="content-header">
			<h3 style="font-weight: bold;">예약하기</h3>
		</div>
		<div class="hostel-info">
            <h4>상품정보</h4>
            <hr style="width: 50%">
            <div class="info-content">
            <div class="hostel-name" > ${hostel.hostelName} </div>
                <div class="detailInfo">
            <div class="optionName">${hostel.roomOption} - ${reserveNum}인 </div>
            <div class="Reservation-period">숙박기간 : ${hostelIndate} ~ ${hostelOutdate}</div>
            <div class="hostel-Price-info">금액: ${hostel.hostelPrice}원</div>
                 </div>
        </div>
        </div>
		<div class="coupon-check">
            <h4>쿠폰</h4>
            <hr style="width: 50%">
            <select class="form-select" aria-label="Default select example" style="width:40%;">
                <option selected disabled class="select-coupon" >쿠폰</option>
                <option value="1">쿠폰1</option>
                <option value="2">쿠폰2</option>
                <option value="3">쿠폰3</option>
              </select>
        </div>
		<div class="point-check">
            <h4>포인트</h4>
            <hr style="">
                <div class="mb-3 input-group" style="width:80%;">
                    <input type="text" class="form-control" id="myPoint" readonly aria-describedby="button-addon2" >
                    <button class="btn btn-outline-secondary" type="button"   id="myPointbtn">내포인트 조회</button>
                </div>
                <div  style="width:80%;" >
                    <label for="useMyPoint" class="form-label"></label>
                    <input type="number" class="form-control" id="useMyPoint" readonly placeholder="사용할 포인트 입력">
                </div>
            
        </div>
		<c:choose>
			<c:when test="${empty sessionScope.m }"><!--비회원주문-->
				<div class="reserve-info">
                    <h4>비회원예약정보</h4>
                    <hr style="width: 50%;">
                    <div class="reserve-info-input">
                        <table class="reserveTable">
                            <tr>
                                <td>예약자 이름 :</td>
                                <td><input type="text" id="guestName" class="form-control" required  ></td>
                            </tr>
                            <tr>
                                <td>예약자 이메일 :</td>
                                <td> <input type="email" id="guestEmail"  class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>예약자 전화번호 :</td>
                                <td> <input type="tel" id="guestPhone" class="form-control" required></td>
                            </tr>
                        </table>
                    <input type="hidden" name="memberNo" id="memberNo" value="0"><!--비회원일때..null확인 ) -->
                    </div>
                </div>
                <div class="reserve-info-ex"><h4>예약 추가 정보</h4> <!--예약테이블에 들어갈부분! 위에는 그냥 예약자 -->
                    <hr style="width: 50%;">

                    <div class="reserve-info-ex-input">
                        <table class="reserveTable">
                            <tr>
                                <td>투숙객 이름 :</td>
                                <td><input type="text" name="reserveName" id="reserveName" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>투숙객 이메일 :</td>
                                <td> <input type="email" name="reserveEmail" id="reserveEmail" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>투숙객 전화번호 :</td>
                                <td> <input type="tel" name="reservePhone" id="reservePhone" class="form-control" required></td>
                            </tr>
                        </table>
               
                <input type="hidden" name="reserveNum" id="reserveNum" value="${reserveNum}">
                <input type="hidden" name="optionNo" id="optionNo" value="${optionNo}">
                <input type="hidden" name="hostelIndate" id="hostelIndate" value="${hostelIndate}">
                <input type="hidden" name="hostelOutdate" id="hostelOutdate" value="${hostelOutdate}">
                <div class="form-check"> <!--예약자정보 복사해주기 -->
                    <input class="form-check-input" type="checkbox" value="" id="copyReserveInfo">
                    <label class="form-check-label" for="flexCheckDefault">
                     예약자와 같음
                    </label>
                </div>
                  </div>
                </div>

			</c:when>
 
			<c:otherwise>
				[${sessionScope.m.memberName }]님 주문정보 
			    <div class="reserve-info">
                    <h4>회원 예약 정보</h4>
                    <hr style="width: 50%;">

                    <div class="reserve-info-input">
                        <table class="reserveTable">
                            <tr>
                                <td>예약자 이름 :</td>
                                <td><input type="text"  id="guestName" value="${sessionScope.m.memberName }"  class="form-control" readonly placeholder="${sessionScope.m.memberName }" ></td>
                            </tr>
                            <tr>
                                <td>예약자 이메일 :</td>
                                <td> <input type="email"   id="guestEmail" value="${sessionScope.m.memberEmail }" class="form-control" placeholder="${sessionScope.m.memberEmail }" readonly ></td>
                            </tr>
                            <tr>
                                <td>예약자 전화번호 :</td>
                                <td> <input type="tel"  id="guestPhone"  value="${sessionScope.m.memberPhone }" class="form-control" placeholder="${sessionScope.m.memberPhone }" readonly ></td>
                            </tr>
                        </table>
                    <input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.m.memberNo}"><!--sessionScope.m.memberNo-->
                    </div>
                </div>
                <div class="reserve-info-ex">
                    <h4>예약 추가 정보</h4>
                    <hr style="width: 50%;">

                    <div class="reserve-info-ex-input">
                        <table class="reserveTable">
                            <tr>
                                <td>예약자 이름 :</td>
                                <td><input type="text" name="reserveName" id="reserveName" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>예약자 이메일 :</td>
                                <td> <input type="email" name="reserveEmail" id="reserveEmail" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>예약자 전화번호 :</td>
                                <td><input type="tel" name="reservePhone" id="reservePhone"class="form-control"  required></td>
                            </tr>
                        </table>
                    <input type="hidden" name="reserveNum" id="reserveNum" value="${reserveNum}">
                    <input type="hidden" name="optionNo" id="optionNo" value="${optionNo}">
                    <input type="hidden" name="hostelIndate" id="hostelIndate" value="${hostelIndate}">
                    <input type="hidden" name="hostelOutdate" id="hostelOutdate" value="${hostelOutdate}">
                    <div class="form-check"> <!--예약자정보 복사해주기 -->
                        <input class="form-check-input" type="checkbox" value="" id="copyReserveInfo">
                        <label class="form-check-label" for="flexCheckDefault">
                         예약자와 같음
                        </label>
                        </div>
                      </div>
                </div>
			</c:otherwise>
		</c:choose>
        <div class="pay-info">
            <h4>결제정보</h4>
            <hr style="width: 50%;">
            주문금액 : <span>${hostel.hostelPrice}</span>원<br>
            할인 : 0원<br>
            포인트: 0원 <br>
            <br>
            <div style="font-weight: bold; font-size: 20px;">총결제금액 :<span id="totalPrice"> ${hostel.hostelPrice}</span> 원 </div>
            <input type="hidden" id="hostelName" value="${hostel.hostelName}">
            <input type="hidden" id="payPrice" name="payPrice" value="${hostel.hostelPrice}" ><!--스크립트로 위 text value 바꿔주기 -->
        </div>
        <div class="pay-btn">
            <div class="d-grid gap-2">
                <button type="button" id="payBtn"  class="payBtn btn btn-lg btn-outline-primary">결제하기</button>
            </div>
        </div>
    </form>
	</div>
	<!--contentWrap종료 -->

  <script src="/resources/js/hostel/hostelReserveFrm.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>