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
        background-color: rgb(245 245 245);
    }
    .page2{
        display: none;
    }
    .flexBox{
        display: flex;
    }
    .payInfoBox{
    border-collapse: separate;
    border-spacing: 0 10px;
    }
    .payInfoBox>tbody>tr>th{
        text-align: left;
    }

    .payBox{
        width: 100%;
        margin-left: 50px;
    }
    .content-lfet{
        width: 700px;
        margin: 0;
        display: inline;
    }
    .content-right{
        width: 250px;
        margin: 0;
        display: inline;
    }
    .reserveInfo{
        width: 400px;
    }
    .sideBox{
        width: 300px; 
        height: 250px; 
        position: fixed; 
        top: 350px; left: 60%;
        background-color: #fff;
        border-radius: 2px;
        box-shadow: 0 2px 4px 0 rgb(0 0 0 / 10%), 0 0 0 1px #e9ecef;
        box-sizing: border-box;
        padding: 24px 24px 8px;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content page1" >
        <div class="div-content-left" style="width:700px; float:left;">
            <h2 style="font-weight: 900;">[${ticket.getParentLocalName()}/${ticket.getLocalName()}] ${ticket.getTicketTitle()}</h2>
            <input type="hidden" value="${ticket.getTicketTitle()}">
            <c:choose>
                <c:when test="${ticket.getTicketScore() eq 0}">
                    <img class="star" src="/resources/img/ticket/???0.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 0}">
                    <img class="star" src="/resources/img/ticket/???1.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 1}">
                    <img class="star" src="/resources/img/ticket/???2.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 2}">
                    <img class="star" src="/resources/img/ticket/???3.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 3}">
                    <img class="star" src="/resources/img/ticket/???4.png">
                </c:when>
                <c:when test="${ticket.getTicketScore() gt 4}">
                    <img class="star" src="/resources/img/ticket/???5.png">
                </c:when>
            </c:choose>
            <span>(0)</span>
            
                <table style="margin-top:20px; ">
                    <tr>
                        <td colspan="3"><img src="/resources/upload/ticket/${file.getTicketFilepath1()}" style="width: 694px ;height: 510px;"></td>
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
                    <span id="ticketSpan" style="display: inline-block;">?????? ??? ??????</span>
                    <span class="material-icons" style="color: #FB8C00;">local_fire_department</span>
                    <span>??? ??????????????????!</span>
                </div>
                <c:if test="${ticket.getExpireDate() ne null}">
                    <br>
                    <span class="material-icons" >event_available</span>
                    <span>???????????? (~${ticket.getExpireDate()}) ??? ?????? ??????</span>
                    <input type="hidden" value="${ticket.getExpireDate()}">
                </c:if>
                <p style="margin-top: 20px;">??? ${ticket.getImportantContent()}</p>
            </div>
            <h3 style="margin-bottom: 10px;">?????? ??????</h3>
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
                                <p style="color: red; font-weight: bold;">???<c:out value="${opt.getOptDiscountRate()}"/>%</p>
                                <p style="color: rgb(169, 169, 169); text-decoration: line-through;"><c:out value="${opt.getOptPrice()}"/>???</p>
                            </div>
                            <div class="opt2-bottom">
                                <p style="font-size: 20px; font-weight: bold;"><c:out value="${opt.getOptDiscountPrice()}"/>???</p>
                                <p style="margin-top: 2px;">1???</p>
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
                                <span>???</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="totalPriceBox">
                    <span style="margin-right: 20px;">??? ?????? ??????</span>
                    <span class="totalPrice">000,000???</span>
                    <input type="hidden" id="totalPrice">
                </div>
            </div>
            <div class="btnBox" style="text-align: center; margin-top: 20px;">
                <input type="button" class="btn btn-primary" id="payBtn" value="????????????" style="display: none; width: 30%; margin-right: 10px; height: 50px;">
            </div>
        
            <h3 style="margin-top: 30px;">?????? ??????</h3>
            <div class="content-box">
                <c:out value="${ticket.ticketContent}" escapeXml="false"/>
            </div>
            <h3>?????? ??????</h3>
            <div class="content-box">
                <h5 style="font-weight: bold; margin-top: 10px;">?????? ??????</h5>
                <p><c:out value="${ticket.businessTime}"/></p>
                <hr>
                <h5 style="font-weight: bold;">?????? ??????</h5>
                <p><c:out value="${ticket.businessAddr}"/></p>
                <img src="/resources/upload/ticket/${file.getPlaceFilepath()}" style="width:330px; height:230px ;">
                <hr>
                <h5 style="font-weight: bold; margin-bottom: 30px;">?????? ??????</h5>
                <p>1) ???????????? ??????????????? ?????????????????????.</p>
                <p  style="margin-bottom: 30px;">2) ????????? ?????? ???????????? ????????? ???????????? ???????????? ??????????????????.</p>
                <hr>
                <h5 style="font-weight: bold;">?????? ??? ?????? ??????</h5>
                <p>???????????? ??? ????????? 100% ???????????????.</p>
            </div>
        </div>
        <div class="sideBox">
            <div class="sideBox-top">
                <span style="font-size:20px; font-weight: bold;">${optionList.get(0).getOptDiscountPrice()}???</span>
                <span> ??????~</span>
                <br>
                <br>
            </div>
            <hr>
            <button type="button" class="btn btn-primary" id="ticketBtn" style="width:100%;">?????? ??????</button>
        </div>
    </div>

    <div class="div-content page2">
        <div class="flexBox">
            <div class="content-left" style="width:700px;">
                <h2>????????????</h2>
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
                                            <span>???</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="totalPriceBox">
                                <span style="margin-right: 20px;">??? ?????? ??????</span>
                                <span class="totalPrice">000,000???</span>
                            </div>
                    </div>
                </div>
    
                <h2>????????? ??????</h2>
                <div class="content-box">
                    <table calss="reserveInfo" style="width: 400px;">
                        <tr>
                            <th >????????? ??????  :  </th>
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
                            <th>????????? ??????  :  </th>
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
                            <th>????????????  :  </th>
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
                    <h2>????????????</h2>
                    <div class="content-box">
                        <select id="coupon" name="payCouponCode" class="form-select"></select>
                    </div>
                    <div class="memberNo" style="display: none;">
                        ${sessionScope.m.memberNo}
                    </div>
    
                    <h2>?????????</h2>
                    <input type="number" id="pointUse" value="0" class="form-control" style="text-align: right;">
                    <div class="pointBox">
                        <span id="possiblePoint"></span><span>point ????????????</span>
                    </div>
                </c:if>
                <c:if test="${empty m}">
                    <div class="memberNo" style="display: none;"></div>
                </c:if>
            </div>
            <div class="content-right">
                <div class="payBox" style="padding: 10px; text-align: center;margin-top: 50px;">
                    <h3 style="text-align: center;">????????????</h3>
                    <hr>
                    <table class="payInfoBox" style="padding-left: 25px;">
                        <tr>
                            <th>????????????</th>
                            <td style="width: 15px;"></td>
                            <td class="payinfo" id="payInfoBox1"></td>
                            <td>???</td>
                        </tr>
                            <th>????????????</th>
                            <td style="width: 15px;">-</td>
                            <td class="payinfo" id="payInfoBox2">0</td>
                            <input type="hidden" name="payCoupon">
                            <td>???</td>
                        </tr>
                            <th>?????? ?????????</th>
                            <td style="width: 15px;">-</td>
                            <td class="payinfo" id="payInfoBox3">0</td>
                            <input type="hidden" name="pointUse">
                            <td>???</td>
                        </tr>
                            <th>??? ????????????</th>
                            <td style="width: 15px;"></td>
                            <td class="payinfo" id="payInfoBox4"></td>
                            <td>???</td>
                            <input type="hidden" name="payPrice">
                        </tr>
                        <input type="hidden" name="pointAdd" id="pointAdd">
                    </table>
                    <hr>
                    <button type="button" class="btn btn-primary" id="payBtn2">????????????</button>
                    <input type="button" class="btn btn-secondary" id="payBtn3" value="??????test" style="color: rgb(55, 55, 55);"></input>
                </div>
            </form>
            </div>
            
        </div>
    </div>

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        $(document).ready(function(){
    $("#ticketBtn").on("click",function(event){
        var offset = $("#ticketSpan").offset();
        $("html,body").animate({scrollTop:offset.top},100);
    });

    $(window).resize(function (){
  // width?????? ????????????
  var width_size = window.outerWidth;
  
  // 800 ???????????? if????????? ??????
  if (width_size <= 1270) {
    $(".sideBox").css("display","none");
  }else{
    $(".sideBox").css("display","block");
  }
})
});
    </script>
    <script src="/resources/js/ticket/ticketView.js"></script>
</body>
</html>