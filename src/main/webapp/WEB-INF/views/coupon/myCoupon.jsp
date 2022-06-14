<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/air/findCoupon.css">
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div style="display:none" class="MemberNo">${sessionScope.m.memberNo}</div>
	<div class="div-content">
        <div class="selectcoupon">
            <h3 style="margin-bottom: 30px; margin-top: 50px;">내 보유 쿠폰</h3>
            <div>
                <table class="table couponTable">
                    <thead>
                        <tr style="text-align: center;"><th scope="col">쿠폰 이름</th>
                            <th scope="col">쿠폰번호</th>
                            <th scope="col">할인가격</th>
                            <th scope="col">할인율</th>
                            <th scope="col">적용조건</th>
                            <th scope="col">유효기간</th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
	<script src="/resources/js/air/findCoupon.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>