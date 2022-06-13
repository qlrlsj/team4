<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .infoBottom{
        background-color: #f4f4f4;
        padding: 20px;
    }
    .infoBottom>.row{
        height: 35px;
        border-bottom: 1px solid #c4c4c4;
    }
    .infoBottom>.row>.col{
        line-height: 35px;
    }
    .infoTop{
        padding: 20px;
    }
    .content-box>.paidBox{
        width: 70%;
    }
    .bottomBox{
        text-align: center;
    }
    .contentBox2{
        margin-bottom: 50px;
    }
</style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <input type="hidden" id="ticketNo" value="${ticketR.getTicketNo()}">
    <input type="hidden" id="reserveNo" value="${ticketR.getReserveNo()}">
    <div class="div-content"  style="width: 60%; border: 1px solid c4c4c4;">
        <h2 style="margin-top: 50px; text-align: center;">예약 완료</h2>
        <hr style="margin:30px 0;">
        <div class="content-box2" style="margin-bottom: 60px;">
            <div class="content-box">
                <div class="infoTop" style="display: flex; flex-direction: center; margin-bottom: 20px;">
                     <img id="filepath" style="width: 100px; height: 100px;" >
                    <p id="title" style="font-size:20px; margin-left:20px; line-height: 84px;"></p>
                </div>
                <div class="infoBottom">
                </div>
            </div>
            <div class="content-box" style="text-align: center; margin-bottom: 30px;">
                <table class="paidBox table table-bordered" style="text-align: center; margin: 0 auto;">
                    <tr>
                        <th>주문금액</th>
                        <td class="">${payment.getPayPrice()+payment.getPointUse()+payment.getPayCoupon()} 원</td>
                    </tr>
                        <th>쿠폰할인</th>
                        <td class="">- ${payment.getPayCoupon()} 원</td>
                    </tr>
                        <th>사용 포인트</th>
                        <td class="">- ${payment.getPointUse()} point</td>
                    </tr>
                        <th>총 결제금액</th>
                        <td class="">${payment.getPayPrice()} 원</td>
                    </tr>
                    <hr>
                </table>
            </div>

            <div class="content-box" style="text-align: center;">
                <table class="paidBox table table-bordered" style="margin: 0 auto;">
                    <tr>
                        <th>예약자 이름</th>
                        <td class="">${ticketR.getReserveName()}</td>
                    </tr>
                        <th>이메일 주소</th>
                        <td class="">${ticketR.getReserveEmail()}</td>
                    </tr>
                        <th>전화 번호</th>
                        <td class="">${ticketR.getReservePhone()}</td>
                    </tr>
                        <th>예약 번호</th>
                        <td class="">${ticketR.getReserveNo()}</td>
                    </tr>
                </table>
            </div>
            <hr style="margin:30px 0">
            <p style="text-align: center;">이용해주셔서 감사합니다.</p>
            <div class="bottomBox">
                <span style="text-align: center;">${payment.getPointAdd()}</span><span> point가 적립되었습니다. (결제 금액의 10%)</span>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/ticket/reserveSuccess.js"></script>
</body>
</html>