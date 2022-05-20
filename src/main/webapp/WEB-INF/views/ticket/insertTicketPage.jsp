<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<h3>1. 주소입력</h3>
	<form class="row g-3" action="/insertTicket.kt">
		<div class="col-md-4">
			<select id="category1" class="form-select">
				<option value="0">1차 카테고리 선택</option>
			</select>
		</div>
		<div class="col-md-4">
			<select id="category2" class="form-select">
				<option value="0">2차 카테고리 선택</option>
			</select>
		</div>
		<button type="submit" id="cateBtn">제출</button>
		<pre class="chk" id="chk" style="font-size: 15px;">   </pre>
	</form>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	$(document).ready(function(){
		let selectBox1 = $("#category1");
		let selectBox2 = $("#category2");
		
		<c:forEach items="${ticketCategory }" var="tc">
		<c:if test="${tc.parentCategoryId eq 0}">
			selectBox1.append("<option value='${tc.categoryId}'>${tc.categoryName}</option>");
		</c:if>
		</c:forEach>
		
		selectBox1.on("change",function(){
			const selectBox1Val = $("#category1 option:selected").val();
			selectBox2.children().remove();
			if(selectBox1Val!=0){
				<c:forEach items="${ticketCategory}" var="tc">
				if(${tc.parentCategoryId}==selectBox1Val){
					selectBox2.append("<option value='${tc.categoryId}'>${tc.categoryName}</option>");
				}
				</c:forEach>
			}else{
				selectBox2.append("<option value='0'>2차 카테고리 선택</option>");
			}
		});
		
	});
	
	$("#cateBtn").on("click",function(){
		const selectBox1Val = $("#category1 option:selected").val();
		const selectBox2Val = $("#category2 option:selected").val();
		if(selectBox1Val==0||selectBox2Val==0){
			$("#chk").text("카테고리 입력하세요.");
			$("#chk").css("color","red");
		}
		
	});
	
	
	</script>
</body>
</html>
