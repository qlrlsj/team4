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
        
    }
    .qtt{
        border: none;
        width: 30px;
    }

    #followquick{
        position:sticky;
        top:180px; 
        right:10%;
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
</style>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content" >
        <div class="div-content-left" style="width:700px; float:left;">
            <h2 style="font-weight: 900;">[${ticket.getParentLocalName()}/${ticket.getLocalName()}] ${ticket.getTicketTitle()}</h2>
            <input type="hidden" name="ticketTitle" value="${ticket.getTicketTitle()}">
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
                        <input type="hidden" name="ticketFilepath1" value="${file.getTicketFilepath1()}">
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
                    <input type="hidden" name="expireDate" value="${ticket.getExpireDate()}">
                </c:if>
                <p style="margin-top: 20px;">※ ${ticket.getImportantContent()}</p>
            </div>
            <div class="content-box container" style="padding: 20px 30px; background-color: #f3f3f3;">
                <form action="/reserveForm.kt?ticketNo=${ticket.getTicketNo()}">
                <c:forEach items="${optionList}" var="opt"  varStatus="status">
                    <div class="optBox row">
                        <input type="hidden" id="no" value="${status.index}">
                        <div class="optBox-1 col" style="flex-grow: 2.5;">
                            <input type="hidden" namte="optTitle" id="optTitle" value="${opt.getOptTitle()}" readonly>
                            <input type="hidden" id="optContent" value="${opt.getOptContent()}" readonly>
                            <p style="font-weight: bold;"><c:out value="${opt.getOptTitle()}"/></p>
                            <p><c:out value="${opt.getOptContent()}"/></p>
                        </div>
                        <div class="optBox-2 col" style="flex-grow: 1; padding: 0;">
                            <input type="hidden" id="optPrice" value="${opt.getOptPrice()}" readonly>
                            <input type="hidden" id="optDiscountRate" value="${opt.getOptDiscountRate()}" readonly>
                            <input type="hidden" id="optDiscountPrice" value="${opt.getOptDiscountPrice()}" readonly>
                            <p><c:out value="${opt.getOptPrice()}"/>원</p>
                            <p><c:out value="${opt.getOptDiscountRate()}"/>%</p>
                            <p><c:out value="${opt.getOptDiscountPrice()}"/>원</p>
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
                    <div class="priceBox" style="display: none;">
                        <div class='row'>
                            <div class='col optTitle'>
                                <span><c:out value="${opt.getOptTitle()}"/></span>
                            </div>
                            <div class='col'>
                                <input class="optQtt${status.index}" value="0"><c:out value=" x ${opt.getOptDiscountPrice()}"></c:out>
                            </div>
                            <div class="col">
                                <input class="dPrice${status.index}" value="0">
                                <span>원</span>
                            </div>
                            
                            
                        </div>
                    </div>
                </c:forEach>
                <input type="submit" id="submitBtn" value="결제하기">
            </form>
            </div>
            <div class="content-box">
                <h3>상품 정보</h3>
                <c:out value="${ticket.ticketContent}" escapeXml="false"/>
            </div>
            <div class="content-box">
                <h3>이용 안내</h3>
                <h5>이용 시간</h5>
                <p><c:out value="${ticket.businessTime}"/></p>
                <h5>위치 안내</h5>
                <p><c:out value="${ticket.businessAddr}"/></p>
                <img src="/resources/upload/ticket/${file.getPlaceFilepath()}" style="width:330px; height:230px ;">
                <h5>이용 방법</h5>
                <p>1) 이메일로 예약내역을 발송해드립니다.</p>
                <p>2) 매표소 또는 입구에서 수신한 바코드를 제시하여 입장해주세요.</p>
                <h5>취소 및 환불 규정</h5>
                <p>유효기간 내 취소시 100% 환불됩니다.</p>
            </div>
            
        </div>
        <div class="div-content-right" style="float: right;"></div>
            <div id="followquick">
                <ul>
                    <li><a href="#">등급별혜택</a></li>
                    <li><a href="#">1:1문의</a></li>
                    <li><a href="#">후기</a></li>
                </ul>
            </div>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
       
    </script>
    <script src="/resources/js/ticket/ticketView.js"></script>
</body>
</html>