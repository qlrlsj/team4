<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 숫자포멧 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.imgClass{
		width: 100%;
		max-height: 225px;
		min-height: 225px;
	}
	.card-body{
		max-height: 127px;
		min-height: 127px;
	}
	.card-text{
		max-height: 48px;
		min-height: 48px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="div-content">
		  <section class="py-5 text-center container">
		    <div class="row py-lg-5">
		      <div class="col-lg-6 col-md-8 mx-auto">
		        <h1 class="fw-light">Package product</h1>
		        <p class="lead text-muted">Plan your trip at a cheaper price by using package products!</p>
		        <p>
		        <c:if test="${not empty sessionScope.m }"> <!-- 현재 로그인이 되어있는지(세션에 있는 값이 null인지 아닌지 검사 -->
		          <a href="/insertPackagePage.kt" class="btn btn-primary my-2">Product registration</a>
		        </c:if>
	<!-- 		          <a href="#" class="btn btn-secondary my-2">Secondary action</a> -->
		        </p>
		      </div>
		    </div>
		  </section>
	  
		  <div class="album py-5 bg-light">
		    <div class="container">
		      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	      		<c:forEach items="${list }" var="p" varStatus="i">
					<div class="col">
			          <div class="card shadow-sm">
							<c:set var="imgClass" value="${p.mainfile }"></c:set>
							<c:if test="${not empty imgClass }">
								<img class="imgClass" src="/resources/upload/package/${p.mainfile }">
							</c:if>
							<c:if test="${empty imgClass }">
								<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" 
			            		role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
			            		<rect width="100%" height="100%" fill="#55595c"/><text x="18%" y="50%" fill="#eceeef" dy=".3em">Please register your main picture</text></svg>
							</c:if>
	
			            <div class="card-body">
			              <p class="card-text">${p.packageTitle }</p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <a class="btn btn-sm btn-outline-secondary" href="/packageView.kt?packageNo=${p.packageNo }">View</a>
			                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                </div>
			                <small class="text-muted"><fmt:formatNumber value="${p.packagePrice}" pattern="#,###,###,###"/>원 / 1인</small>
			              </div>
			            </div>
		          </div>
		        </div>
			</c:forEach>
	     </div>
	   </div>
	  </div>
	</div>
		
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>