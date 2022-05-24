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
	<h3>1. 카테고리 입력</h3>
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
		<pre class="chk" id="categoryChk" style="font-size: 15px;">   </pre>
		<button type="button" id="btn">제출</button>
	</form>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	$(document).ready(function(){
		
		//1. 카테고리 데이터 불러오기
		const categoryBox1 = $("#category1");
		const categoryBox2 = $("#category2");
		
		$.ajax({
	         url : "/selectAllTicketCategory.kt",
	         success:function(list){
               for(let i=0;i<list.length;i++){
            	   if(list[i].parentCategoryId == 0){
            		   categoryBox1.append("<option value='"+list[i].categoryId+"'>"+list[i].categoryName+"</option>");
            	   }
               }
	         }
	      });
		
		selectBox1.on("change",function(){
			const categoryBox1Val = $("#category1 option:selected").val();
			selectBox2.children().remove();
			if(categoryBox1Val!=0){
				$.ajax({
			         url : "/selectAllTicketCategory.kt",
			         success:function(list){
		               for(let i=0;i<list.length;i++){
		            	   if(list[i].parentCategoryId == selectBox1Val){
		            		   categoryBox2.append("<option value='"+list[i].categoryId+"'>"+list[i].categoryName+"</option>");
		            	   }
		               }
			         }
			      });
			}else{
				categoryBox2.append("<option value='0'>2차 카테고리 선택</option>");
			}
		});
		
		//2.지역 카테고리 데이터 불러오기
		
		
	});
	
	
	
	//유효성검사
	$("#cateBtn").on("click",function(){
		
		//1.카테고리 유효성 검사
		const categoryBox1Val = $("#category1 option:selected").val();
		const categoryBox2Val = $("#category2 option:selected").val();
		if(categoryBox1Val==0||categoryBox2Val==0){
			$("#categoryChk").text("카테고리 입력하세요.");
			$("#categoryChk").css("color","red");
		}else{
			$("#categoryChk").text(" ");
			$("#btn").prop("type","submit");
		}
		
		//2.
	});
	
	
	</script>
</body>
</html>
