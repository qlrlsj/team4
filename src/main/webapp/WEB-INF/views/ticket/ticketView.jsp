<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.div-content{
		margin-top: 50px;
	}

    .optBox{
        margin: 20px auto;
        padding: 30px 10px;
        background-color: #fff;
        border-radius: 5px;
        border: 1px solid rgb(184, 184, 184);
        display: flex;
    }
    .optBox-1{
        flex-grow: 3;
    }
    .optBox-1{
        flex-grow: 1;
    }
    .optBox-1{
        flex-grow: 1;
    }
    .addBox{
        border-bottom: 1px solid black;
    }
    .varyBtn{
        border: none;
        background-color: white;
        color: rgb(78, 149, 255);
    }
    .qtt{
        border: none;
        width: 30px;
    }

    #sideBox{
        position:sticky;
        top:350px; 
    }
    
    .content-box{
        border: 1px solid rgb(225, 225, 225);
        padding: 20px;
        margin-bottom: 30px;
    }
    .star{
        width: 100px;
        height: 20px;
    }
    h3{
        margin-bottom: 15px;
    }
    content-box>h5{
        font-weight: bold;
    }
    .priceBox{
        padding-top: 10px;
        padding-bottom: 5px;
        border-bottom: 1px solid rgba(153, 153, 153, 0.2);
        display: none;
    }
    .priceBox>.row>.col{
        text-align: right;
    }
    .priceBox>.row>.col>.InputText{
        border: none; 
        background-color: #f3f3f3;
         display: inline; 
         width:50px;
         text-align: right;
    }
    .content-box>h5{
        margin: 20px 0;
        margin-top: 40px;
        padding-left:20px;
    }
    .content-box>p{
        padding-left: 25px;
    }
    .content-box>img{
        margin-left: 25px;
        margin-bottom: 30px;
    }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    }
    .optBox-3{
        display: flex;
        justify-content: center;
    }
    .opt2-top{
        overflow: hidden;
    }
    .opt2-top>p{
        float: right;
        margin-right: 20px;
    }
    .opt2-bottom{
        overflow: hidden;
    }
    .opt2-bottom>p{
        float: right;
        margin-right: 20px;
    }
    .totalPriceBox{
        text-align: right;
        display: none;
        margin-top: 20px;
    }
    .addTotal{
        display: block;
    }
    .optPriceBox{
        display: block;
    }
    .totalPrice{
        font-size: 30px;
        font-weight: bold;
    }
    #payBtn{
        display: none;
    }
    .pointBox{
        text-align: right;
    }
    .payinfo{
        text-align: right;
    }
    .payBox{
        background-color: rgb(204, 204, 204);
    }
    .page2{
        display: none;
    }

</style>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content page1" >
        <div class="div-content-left" style="width:700px; float:left;">
            <h2 style="font-weight: 900;">[${ticket.getParentLocalName()}/${ticket.getLocalName()}] ${ticket.getTicketTitle()}</h2>
            <input type="hidden" value="${ticket.getTicketTitle()}">
            <c:choose>
                <c:when test="${ticket.getTicketScore() eq 0}">
                    <img class="star" src="/resources/img/ticket/별0.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 0}">
                    <img class="star" src="/resources/img/ticket/별1.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 1}">
                    <img class="star" src="/resources/img/ticket/별2.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 2}">
                    <img class="star" src="/resources/img/ticket/별3.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 3}">
                    <img class="star" src="/resources/img/ticket/별4.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 4}">
                    <img class="star" src="/resources/img/ticket/별5.png">
                </c:when>
            </c:choose>
            <span>리뷰수</span>
            
                <table style="margin-top:20px; ">
                    <tr>
                        <td colspan="3"><img src="/resources/upload/ticket/${file.getTicketFilepath1()}" style="width: 700px ;height: 450px;"></td>
                    </tr>
                    <tr>
                        <td><img src="/resources/upload/ticket/${file.getTicketFilepath2()}" style="width: 230px ;height: 170px;"></td>
                        <td><img src="/resources/upload/ticket/${file.getTicketFilepath3()}" style="width: 230px ;height: 170px;"></td>
                        <td><img src="/resources/upload/ticket/${file.getTicketFilepath4()}" style="width: 230px ;height: 170px;"></td>
                        <input type="hidden" value="${file.getTicketFilepath1()}">
                    </tr>
                </table>
            
            <br>
            <div class="content-box">
                <div style="line-height: 100%;">
                    <span class="material-icons">info_outline</span>
                    <span class="material-icons" style="color: #FB8C00;">local_fire_department</span>
                    <span style="display: inline-block;">예약 전 필독</span>
                    <span class="material-icons" style="color: #FB8C00;">local_fire_department</span>
                    <span>꼭 확인해주세요!</span>
                </div>
                <c:if test="${ticket.getExpireDate() ne null}">
                    <br>
                    <span class="material-icons" >event_available</span>
                    <span>유효기간 (~${ticket.getExpireDate()}) 내 사용 가능</span>
                    <input type="hidden" value="${ticket.getExpireDate()}">
                </c:if>
                <p style="margin-top: 20px;">※ ${ticket.getImportantContent()}</p>
            </div>
            <h3 style="margin-bottom: 10px;">티켓 선택</h3>
            <div class="content-box container" style="padding: 20px 30px; background-color: #f3f3f3; margin-bottom: 10px;">
                <form action="/reserveTicket.kt" method="post">
                    <input type="hidden" name="ticketNo" value="${ticket.getTicketNo()}">
                    <c:choose>
                        <c:when test="${!empty m}">
                            <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="memberNo" value="0">
                        </c:otherwise>
                    </c:choose>
                    
                <c:forEach items="${optionList}" var="opt"  varStatus="status">
                    <div class="optBox row">
                        <input type="hidden" id="no" value="${status.index}">
                        <div class="optBox-1 col" style="flex-grow: 2;">
                            <input type="hidden" id="optTitle" value="${opt.getOptTitle()}" readonly>
                            <input type="hidden" id="optContent" value="${opt.getOptContent()}" readonly>
                            <p style="font-weight: bold;"><c:out value="${opt.getOptTitle()}"/></p>
                            <p><c:out value="${opt.getOptContent()}"/></p>
                        </div>
                        <div class="optBox-2 col" style="flex-grow: 1.5; padding: 0;">
                            <input type="hidden" id="optPrice" value="${opt.getOptPrice()}" readonly>
                            <input type="hidden" id="optDiscountRate" value="${opt.getOptDiscountRate()}" readonly>
                            <input type="hidden"  class="optDiscountPrice" id="optDiscountPrice" value="${opt.getOptDiscountPrice()}" readonly>
                            <div class="opt2-top">
                                <p style="color: red; font-weight: bold;">↓<c:out value="${opt.getOptDiscountRate()}"/>%</p>
                                <p style="color: rgb(169, 169, 169); text-decoration: line-through;"><c:out value="${opt.getOptPrice()}"/>원</p>
                            </div>
                            <div class="opt2-bottom">
                                <p style="font-size: 20px; font-weight: bold;"><c:out value="${opt.getOptDiscountPrice()}"/>원</p>
                                <p style="margin-top: 2px;">1명</p>
                            </div>
                        </div>
                        <div class="optBox-3 col" style="flex-grow: 1.5; padding: 0; text-align: center;">
                            <button type="button" class="material-icons minus varyBtn" style="font-size: 35px;">remove_circle_outline</button>
                            <input type="number" class="qtt" id="optQuantity" name="optQuantity" min="0" max="${opt.getOptStock()}" value="0" readonly style="text-align: center;">
                            <input type="hidden" value="${opt.getOptStock()}">
                            <button type="button" class="material-icons plus varyBtn addDiv" style="font-size: 35px;">add_circle_outline</button>
                            <input type="hidden" name="optNo" value="${opt.getOptNo()}">
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="opt" items="${optionList}"  varStatus="status">
                    <div class="priceBox">
                        <div class='row'>
                            <div class='col optTitle' style="text-align: left;">
                                <span><c:out value="${opt.getOptTitle()}"/></span>
                            </div>
                            <div class='col'>
                                <input class="optQtt${status.index} InputText" value="0">
                                <span><c:out value=" x ${opt.getOptDiscountPrice()}"></c:out></span>
                            </div>
                            <div class="col">
                                <input class="dPrice${status.index}  InputText" value="0" style="border: none; background-color: #f3f3f3;">
                                <span>원</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="totalPriceBox">
                    <span style="margin-right: 20px;">총 여행 금액</span>
                    <span class="totalPrice">000,000원</span>
                    <input type="hidden" id="totalPrice">
                </div>
            </div>
            
            <input type="button" class="btn btn-primary" id="payBtn" value="결제하기">

        
            <h3 style="margin-top: 30px;">상품 정보</h3>
            <div class="content-box">
                <c:out value="${ticket.ticketContent}" escapeXml="false"/>
            </div>
            <h3>이용 안내</h3>
            <div class="content-box">
                <h5 style="font-weight: bold; margin-top: 10px;">이용 시간</h5>
                <p><c:out value="${ticket.businessTime}"/></p>
                <hr>
                <h5 style="font-weight: bold;">위치 안내</h5>
                <p><c:out value="${ticket.businessAddr}"/></p>
                <img src="/resources/upload/ticket/${file.getPlaceFilepath()}" style="width:330px; height:230px ;">
                <hr>
                <h5 style="font-weight: bold; margin-bottom: 30px;">이용 방법</h5>
                <p>1) 이메일로 예약내역을 발송해드립니다.</p>
                <p  style="margin-bottom: 30px;">2) 매표소 또는 입구에서 수신한 바코드를 제시하여 입장해주세요.</p>
                <hr>
                <h5 style="font-weight: bold;">취소 및 환불 규정</h5>
                <p>유효기간 내 취소시 100% 환불됩니다.</p>
            </div>
        </div>

    </div>

    <div class="div-content page2">
        <div class="content-left" style="width:700px;">
            <h2>상품정보</h2>
            <div class="content-box">
                <div class="infoTop" style="display: flex; flex-direction: center; margin-bottom: 20px;">
                    <img src="/resources/upload/ticket/${file.getTicketFilepath1()}" style="width: 100px; height: 100px;" >
                    <p style="font-size:20px; margin-left:20px;">${ticket.getTicketTitle()}</p>
                </div>
                <div class="infoBottom">
                    <c:forEach var="opt" items="${optionList}"  varStatus="status">
                            <div class="priceBox">
                                <div class='row'>
                                    <div class='col optTitle' style="text-align: left;">
                                        <span><c:out value="${opt.getOptTitle()}"/></span>
                                    </div>
                                    <div class='col'>
                                        <input class="optQtt${status.index} InputText" value="0" style="background-color: #fff;">
                                        <span><c:out value=" x ${opt.getOptDiscountPrice()}"></c:out></span>
                                    </div>
                                    <div class="col">
                                        <input class="dPrice${status.index}  InputText" value="0" style="border: none; background-color: #fff;">
                                        <span>원</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="totalPriceBox">
                            <span style="margin-right: 20px;">총 여행 금액</span>
                            <span class="totalPrice">000,000원</span>
                        </div>
                </div>
            </div>

            <h2>예약자 정보</h2>
            <div class="content-box">
                <table calss="reserveInfo">
                    <tr>
                        <th >예약자 이름 : </th>
                        <td>
                            <c:choose>
                                <c:when test="${!empty m}">
                                    <input class="form-control" type="text" name="reserveName" value="${sessionScope.m.memberName}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control"  type="text" name="reserveName" required>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일 주소 : </th>
                        <td>
                            <c:choose>
                                <c:when test="${!empty m}">
                                    <input class="form-control"  type="text" name="reserveEmail" value="${sessionScope.m.memberEmail}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control"  type="text" name="reserveEmail" required>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호 : </th>
                        <td>
                            <c:choose>
                                <c:when test="${!empty m}">
                                    <input class="form-control"  type="text" name="reservePhone" value="${sessionScope.m.memberPhone}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control"  type="text" name="reservePhone" required>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>


            <c:if test="${!empty m}">
                <h2>쿠폰할인</h2>
                <div class="content-box">
                    <select id="coupon" name="payCouponCode" class="form-select"></select>
                </div>
                <div class="memberNo" style="display: none;">
                    ${sessionScope.m.memberNo}
                </div>

                <h2>포인트</h2>
                <input type="number" id="pointUse" value="0" class="form-control" style="text-align: right;">
                <div class="pointBox">
                    <span id="possiblePoint"></span><span>point 사용가능</span>
                </div>
            </c:if>
            <c:if test="${empty m}">
                <div class="memberNo" style="display: none;"></div>
            </c:if>
        </div>
        <div class="content-right">
            <div class="payBox">
                <h3>결제정보</h3>
                <hr>
                <table class="payInfoBox">
                    <tr>
                        <th>주문금액</th>
                        <td></td>
                        <td class="payinfo" id="payInfoBox1"></td>
                    </tr>
                        <th>쿠폰할인</th>
                        <td>-</td>
                        <td class="payinfo" id="payInfoBox2">0</td>
                        <input type="hidden" name="payCoupon">
                    </tr>
                        <th>사용 포인트</th>
                        <td>-</td>
                        <td class="payinfo" id="payInfoBox3">0</td>
                        <input type="hidden" name="pointUse">
                    </tr>
                        <th>총 결제금액</th>
                        <td></td>
                        <td class="payinfo" id="payInfoBox4"></td>
                        <input type="hidden" name="payPrice">
                    </tr>
                    <input type="hidden" name="pointAdd" id="pointAdd">
                </table>
                <button type="button" class="btn btn-primary" id="payBtn2">결제하기</button>
            </div>
        </form>
        </div>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
       
    </script>
    <script src="/resources/js/ticket/ticketView.js"></script>
</body>
</html>