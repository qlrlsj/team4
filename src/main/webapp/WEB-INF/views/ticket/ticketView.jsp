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
    .Content-box{
    }
    .optBox{
        margin: 20px auto;
        padding: 10px 10px;
    }
    .optBox-left{
    }
    .optBox-right{
    }
    .addBox{
        border-bottom: 1px solid black;
    }
    
</style>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content">
        <div class="div-content-left">
            <h2>[${ticket.getParentLocalName()}/${ticket.getLocalName()}] ${ticket.getTicketTitle()}</h2>
            <span>${ticket.getTicketScore()}</span>
            <span>리뷰수</span>
            <table>
                <tr>
                    <td colspan="3"><img src="/resources/upload/ticket/${file.getTicketFilepath1()}" style="width: 700px ;height: 450px;"></td>
                </tr>
                <tr>
                    <td><img src="/resources/upload/ticket/${file.getTicketFilepath2()}" style="width: 230px ;height: 170px;"></td>
                    <td><img src="/resources/upload/ticket/${file.getTicketFilepath3()}" style="width: 230px ;height: 170px;"></td>
                    <td><img src="/resources/upload/ticket/${file.getTicketFilepath4()}" style="width: 230px ;height: 170px;"></td>
                </tr>
            </table>
            <br>
            <div class="content-box">
                <span class="material-icons">info_outline</span>
                <span class="material-icons" style="color: #FB8C00;">local_fire_department</span>
                <span>예약 전 필독</span>
                <span class="material-icons" style="color: #FB8C00;">local_fire_department</span>
                <span>꼭 확인해주세요!</span>
                <c:if test="${ticket.getExpireDate() ne null}">
                    <br>
                    <span class="material-icons" >event_available</span>
                    <span>유효기간 (~${ticket.getExpireDate()}) 내 사용 가능</span>
                </c:if>
                <p>※ ${ticket.getImportantContent()}</p>
            </div>
            <div class="content-box container" style="background-color: gray; padding: 20px 20px;">
                
                <c:forEach items="${optionList}" var="opt"  varStatus="status">
                    <div class="optBox row" style="background-color: yellow;">
                        <input type="hidden" id="no" value="${status.index}">
                        <div class="optBox-left col">
                            <input type="hidden" id="optTitle" value="${opt.getOptTitle()}" readonly>
                            <input type="hidden" id="optContent" value="${opt.getOptContent()}" readonly>
                            <p><c:out value="${opt.getOptTitle()}"/></p>
                            <p><c:out value="${opt.getOptContent()}"/></p>
                        </div>
                        <div class="optBox-right col">
                            <input type="hidden" id="optPrice" value="${opt.getOptPrice()}" readonly>
                            <input type="hidden" id="optDiscountRate" value="${opt.getOptDiscountRate()}" readonly>
                            <input type="hidden" id="optDiscountPrice" value="${opt.getOptDiscountPrice()}" readonly>
                            <p><c:out value="${opt.getOptPrice()}"/>원</p>
                            <p><c:out value="${opt.getOptDiscountRate()}"/>%</p>
                            <p><c:out value="${opt.getOptDiscountPrice()}"/>원</p>
                        </div>
                        <div class="col">
                            <button type="button" class="material-icons minus varyBtn">
                                remove_circle_outline
                            </button>
                            <input type="number" class="qtt" id="optQuantity" name="optQuantity" min="0" max="${opt.getOptStock()}" value="0" readonly>
                            <input type="hidden" value="${opt.getOptStock()}">
                            <button type="button" class="material-icons plus varyBtn addDiv">
                                add_circle_outline
                                </button>
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
            </div>
            
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
        
        <div class="div-content-side">
            
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        $("#submitBtn").on("click", function () {
                console.log("${ticket}");
        });
    </script>
    <script src="/resources/js/ticket/ticketView.js"></script>
</body>
</html>