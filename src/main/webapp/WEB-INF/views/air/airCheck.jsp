<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/airCheck.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<div class="div-content">
        <table class="tableTBL">
            <thead style="width: 100%;">
                <tr class="tableHead">
                    <th scope="col" style="width: 25%;">예약번호</th>
                    <th scope="col" style="width: 25%;">예매일자</th>
                    <th scope="col" style="width: 25%;">결제금액</th>
                    <th scope="col" style="width: 25%;">선택</th>
                </tr>
            </thead>
            <tbody class="tableBody">
                <c:choose>
                    <c:when test="${empty list}">
                        <div style="width: 100%; height:100%; text-align:center;">
                            조회 결과가 없습니다.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="reserve" items="${list}" varStatus="">
                            <tr class="forTable" style="height:60px">
                                <td>${reserve.reserveNo}</td>
                                <td class="orderDate">${reserve.orderDate}</td>
                                <td><span>${reserve.airPay}</span><span> (원)</span></td>
                                <td><button class="btn-primary searchBtn">조회</button></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>

                </c:choose>
            </tbody>
        </table>

    </div>
</body>
<script src="/resources/js/air/airCheck.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>