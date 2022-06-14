<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/insertCoupon.css">
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content">

        <div class="p-3 mb-5" style="background-color:#FAC5B0;">
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value="1">
                <label class="btn btn-outline-success" for="btnradio1">항공권</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value="2">
                <label class="btn btn-outline-success" for="btnradio2">숙소</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value="3">
                <label class="btn btn-outline-success" for="btnradio3">티켓</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value="0" checked>
                <label class="btn btn-outline-success" for="btnradio4">전체</label>
            </div>
            <form action="/couponMake.kt" method="get">
                <fieldset>
                    <input type="hidden" name="couponRange">
                    <div class="selectmenu">
                        <div class="space">
                            발급날짜
                        </div>
                        <div class="col">
                            <input type="text" name="couponDate" class=" form-control mu1" readonly>						
                        </div>
                        <div class="space">
                            유효기간
                        </div>
                        <div class="col">
                            <input type="text" name="conponEndDate" class="datepicker form-control mu1" placeholder="유효기간 작성">						
                        </div>
                    </div>
                    <div class="selectmenu">
                        <div class="space">
                            쿠폰이름
                        </div>
                        <div class="col">
                            <input type="text" name="couponName" class="form-control mu1" placeholder="쿠폰이름">
                        </div>
                        <div class="space">
                            적용조건
                        </div>
                        <div class="col">
                            <input type="text" name="couponIf" class="form-control mu1" placeholder="ex)50000 일때 5만원 이상에서 쿠폰적용" >						
                        </div>
                    </div>
                    <div  class="selectmenu">
                        <div class="space">
                            할인 가격
                        </div>
                        <div class="col">
                            <input type="text" name="couponDCPrice" class="form-control mu1" placeholder="할인 가격">
                        </div>
                        <div class="space">
                            할인율
                        </div>
                        <div class="col">
                            <input type="text" name="couponDCRate" class="form-control mu1" placeholder="할인율 (%)" >						
                        </div>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-primary submitBtn" style="float:right">
                            <span class="material-icons">file_upload</span>
                        </button>
                        <button type="submit" class="gosubmit" style="display: none;"></button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
	<script src="/resources/js/air/insertcoupon.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>