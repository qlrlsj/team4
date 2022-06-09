<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<form action="/ticketTest.kt" method="post" enctype="multipart/form-data">
		<h4>4. 옵션 입력</h4>
			
		<div class="content-box" id="opt">
			<div class="optBox">
				<label for="optTitle">옵션 제목</label>
				<input class="form-control" type="text" id="optTitle" name="optTitles" placeholder="제목을 입력해 주세요. (30자 이내)" maxlength="30">
				<label for="optContent">옵션 설명</label>
				<input class="form-control" type="text" id="optContent" name="optContents" placeholder="내용을 입력해 주세요. (100자 이내)" maxlength="100">
				<label for="optPrice">가격</label>
				<input class="form-control price" type="number" id="optPrice" name="optPrices" min="100">
				<label for="optDiscountRate">할인율</label><span>퍼센트(%)</span>
				<input class="form-control" type="number" id="optDiscountRate" name="optDiscountRates" min="0" max="100">
				<label for="optDiscountPrice">할인된 가격</label>
				<input class="form-control price" type="number" id="optDiscountPrice" name="optDiscountPrices" min="100">
				<label for="optStock">재고</label>
				<input class="form-control" type="number" id="optStock" name="optStocks" value="10" min="0">
				<input type="hidden" id="count" name="count" value="1">
			</div>
		</div>
		<button type="button" id="optAdd" onclick="add_optbox()">추가</button>
		<br>
		<button type="submit"> 제출</button>
	</form>
	<script>
//옵션추가

function add_optbox(){
	let count = $("#count").val();
  if(count > 3) return;
  let newDiv = document.createElement('div');
  newDiv.setAttribute("class","optBox");
  newDiv.innerHTML = "<input type='button' value='X' class='delOptBtn' ><br> <label for='optTitle'>옵션 제목</label> <input class='form-control' type='text' id='optTitle' name='optTitles' placeholder='제목을 입력해 주세요. (30자 이내)' maxlength='30'><label for='optContent'>옵션 설명</label> <input class='form-control' type='text' id='optContent' name='optContents' placeholder='내용을 입력해 주세요. (100자 이내)' maxlength='100'> <label for='optPrice'>가격</label> <input class='form-control price' type='number' id='optPrice' name='optPrices' min='100'> <label for='optDiscountRate'>할인율</label><span>퍼센트(%)</span> <input class='form-control' type='number' id='optDiscountRate' name='optDiscountRates' min='0' max='100'> <label for='optDiscountPrice'>할인된 가격</label> <input class='form-control price' type='number' id='optDiscountPrice' name='optDiscountPrices' min='100'> <label for='optStock'>재고</label> <input class='form-control' type='number' id='optStock' name='optStocks' value='10' min='0'> ";

  $("#opt").append(newDiv);
  count++;
  
  $("#count").val(count);
  console.log($("#count").val());

  $(".delOptBtn").off().on("click",function(){
		let count = $("#count").val();
		$(this).parent().remove();
		count--;
		$("#count").val(count);
		console.log($("#count").val());
  });
}

	</script>
</body>
</html>