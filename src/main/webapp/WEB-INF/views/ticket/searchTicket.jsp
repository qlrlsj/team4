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
    .localImg{
        height: 100vh;
        height: 400px;
        line-height: 400px;
        
        background-repeat: no-repeat;
        background-size : cover;
        color:#fff;
        text-align: center;
        font-size: 50px;
        font-weight: bold;
        margin-bottom: 50px;
    }
    .searchStrBox{
        font-weight: bold;
        font-size: 30px;
        text-align: center;
        margin-bottom: 30px;
    }
    .star{
        width: 80px;
        height: 15px;
    }
	.atag{
		color: #383d40;
		text-decoration: none;
	}
	.atag:hover{
		color: #383d40;
		text-decoration: none;
	}
	.card-body-top>p{
		margin-bottom: 0;
	}
	.card-body-bottom{
		display: flex;
		vertical-align: bottom;
	}
	.optPrice{
		color: #8e8e8e;
		text-decoration: line-through;
		flex-grow: 1;
		vertical-align: bottom;
	}
	.optDiscountPrice{
		flex-grow: 1;
		vertical-align: bottom;
	}
	.optDiscountRate{
		color: red;
		font-weight: bold;
		font-size: large;
		flex-grow: 2;
		text-align: right;
	}
    .filterBox{
        text-align: center;
        margin-bottom: 20px;
    }
    .filterBox>button{
        font-size: 20px;
        margin: 0 20px;
        padding: 0;
    }
    #highDiscount{
        font-weight: bold;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-content">
        <c:choose>
            <c:when test="${ticket.size() eq 0}">
                <h2> '${searchStr}' 검색결과</h2>
                <h2>검색 결과가 없습니다.</h2>
            </c:when>
            <c:otherwise>
                <div class="localImg">
                    ${ticket.get(0).getParentLocalName()}
                </div>
                <div class="searchStrBox">
                    '${searchStr}' 검색결과
                </div>
                <div class="filterBox">
                    <a href="/searchTicket.kt?searchStr=${searchStr}&type=optdiscountrate" class="btn" id="highDiscount">▶ 할인율 높은순</a>
                    <a href="/searchTicket.kt?searchStr=${searchStr}&type=optdiscountpricelow"  class="btn" id="lowPrice">▶ 금액 낮은순</a>
                    <a href="/searchTicket.kt?searchStr=${searchStr}&type=optdiscountpricehigh"  class="btn" id="highPrice">▶ 금액 높은순</a>
                </div>
                <div class="album py-5 bg-light">
                    <div class="container">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="justify-content: center;">
                            <c:forEach items="${ticket}" var="t">
                                <div class="col" style="width: 295px;">
                                    <a class="atag" href="/ticketView.kt?ticketNo=${t.getTicketNo()}">
                                        <div class="card shadow-sm">
                                            <img src="/resources/upload/ticket/${t.getTicketFilepath1()}" class="card-img-top" alt="..." style="height: 180px;">
                                            <div class="card-body" style="padding-top: 7px; height: 160px;">
                                                <div class="card-body-top" style="height:110px">
                                                    <p style="margin-bottom: 4px;">${t.getParentCategoryName()} / ${t.getParentLocalName()}</p>
                                                    <p style="font-weight: bold;">[${t.getLocalName()}] ${t.getTicketTitle()}</p>
                                                    <c:choose>
                                                        <c:when test="${t.getTicketScore() eq 0}">
                                                            <img class="star" src="/resources/img/ticket/별0.png">
                                                        </c:when>
                                                        <c:when test="${t.getTicketScore() gt 0}">
                                                            <img class="star" src="/resources/img/ticket/별1.png">
                                                        </c:when>
                                                        <c:when test="${t.getTicketScore() gt 1}">
                                                            <img class="star" src="/resources/img/ticket/별2.png">
                                                        </c:when>
                                                        <c:when test="${t.getTicketScore() gt 2}">
                                                            <img class="star" src="/resources/img/ticket/별3.png">
                                                        </c:when>
                                                        <c:when test="${t.getTicketScore() gt 3}">
                                                            <img class="star" src="/resources/img/ticket/별4.png">
                                                        </c:when>
                                                        <c:when test="${t.getTicketScore() gt 4}">
                                                            <img class="star" src="/resources/img/ticket/별5.png">
                                                        </c:when>
                                                    </c:choose>
                                                    <span>(0)</span>
                                                </div>
                                                <div class="card-body-bottom">
                                                    <div class="optPrice">${t.getOptPrice()}원</div>
                                                    <div class="optDiscountPrice">${t.getOptDiscountPrice()}원</div>
                                                    <div class="optDiscountRate">${t.getOptDiscountRate()}%</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="parentLocalName" value="${ticket.get(0).getParentLocalName()}">
            </c:otherwise>
        </c:choose>
    </div>
    <input type="hidden" id="ticketSize" value="${ticket.size()}">
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        $(document).ready(function(){
            if(ticketSize!=0){
                const parentLocalName = $("#parentLocalName").val();
                $(".localImg").css("background-image","url(/resources/img/ticket/"+parentLocalName+".png)");
            }
        });
    </script>
</body>
</html>