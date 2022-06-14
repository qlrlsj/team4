<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 상품등록 ::</title>
<!-- 다음 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/seller/seller.css">
<style>
	.content-box>*{
		font-size: 18px;
	}
	.chk{
		font-size: 15px;
		margin: 0;
	}
	.content-box{
		max-width: 1160px;
		border: 1px solid #d4d4d4;
		padding: 20px;
	}
	.content-box>.container{
		padding: 0;
	}
	.optBox{
		background-color: #f3f3f3;
		padding: 20px;
		margin: 35px;
		border: 1px solid #c9c9c9;
	}
	.delOptBtn{
		float: right;
	}
	.div-content{
		margin-top: 10px;
	}

	h4{
		margin-bottom: 0;
	}
	.selectBox{
		display: flex;
		justify-content: flex-start;
	}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<hr>
	<div class="sellerWrap" >
		<div class="list-group list-style">
			  <a href="/sellerPage.kt" class="list-group-item list-group-item-action" > 내 정보 </a>
			  <a href="/sellerProductOption.kt" class="list-group-item list-group-item-action active" aria-current="true">상품 관리</a>
			  <a href="/sellerCash.kt" class="list-group-item list-group-item-action">정산 관리</a>
			  <a href="/sellerReserveManage.kt" class="list-group-item list-group-item-action">예약 관리</a>
			  <a href="/sellerAcount.kt" class="list-group-item list-group-item-action">계정 관리</a>
		</div>
		
		<div class="div-content" style="max-width: 900px; margin-right: 200px;">
			<form class="g-3" action="/insertTicket.kt" method="post" enctype="multipart/form-data">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			<h2 style="font-weight: 600; margin-top: 40px; margin-bottom: 60px;">티켓 상품 등록</h2>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
				<h4 class="h4">1. 카테고리</h4>
				<div class="content-box">
					<p>1) 필터 선택 : </p>
					<div class="selectBox">
						<div class="col-md-4" style="margin: 0 20px;">
							<select id="category1" class="form-select" >
								<option value="0">1차 카테고리 선택</option>
							</select>
						</div>
						<div class="col-md-4" style="margin:0 20px;">
							<select id="category2" name="categoryId" class="form-select ">
								<option value="0">2차 카테고리 선택</option>
							</select>
						</div>
					</div>
					<pre class="chk" id="categoryChk1" style="margin-top:0;">   </pre>
					
					<p id="dateP" style="padding-left: 10px; color: #4673d9;
				"></p>
					<div class="selectBox">
						<label for="startDate" style="margin-top:0;"></label>
						<input class=" datepicker form-control" type="hidden" id="startDate" name="startDate" placeholder="시작날짜 입력" style="width: 35%; margin:0 20px;">
						<label for="expireDate" style="margin-top:0;"></label>
						<input class=" datepicker form-control" type="hidden" id="expireDate" name="expireDate" placeholder="만료날짜 입력" style="width: 35%;">
					</div>
				</div>
	
				<h4 class="h4">2. 주소 입력</h4>
				<div class="content-box">
					<p>1) 필터 선택 : </p>
					<div class="selectBox">
						<div class="col-md-4" style="margin:0 20px;">
							<select id="local1" class="form-select">
								<option value="0">광역시·도</option>
							</select>
						</div>
						<div class="col-md-4" style="margin:0 20px;">
							<select id="local2" class="form-select" name="localId">
								<option value="0">지역명</option>
							</select>
						</div>
					</div>
					<pre class="chk" id="localChk1" style="margin-top: 0px;">   </pre>
					<div class="selectBox">
						<p>2) 상세 주소 입력 : </p>
						<input
							class="btn btn-light btn-sm ticketBtn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: 1px solid #cdcdcd;
							margin-left: 20px;
							padding: 0 8px;
							height: 35px;
						">
					</div>
					<div class="selectBox">
						<input class="form-control-sm addrForm" type="text" id="sample6_postcode" placeholder="우편번호" readonly> 
						<input class="form-control addrForm" type="text" id="sample6_address" placeholder="주소" readonly>
					</div>
					<div class="selectBox">
						<input
						   class="form-control addrForm" type="text" id="sample6_detailAddress" placeholder="상세주소"> <input
						   class="form-control-sm addrForm" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly>
					   <input type="hidden" name="businessAddr">
					</div>
					<pre class="chk" id="localChk2" style="margin-top:0;">   </pre>
				</div>
	
				<h4 class="h4">3. 상품 정보 입력</h4>
				<div class="content-box">
					<label for="ticket-title">1) 상품 제목</label>
					<textarea class="form-control" type="text" name="ticketTitle"  placeholder="제목을 입력해 주세요. (50자 이내)" maxlength="50" ></textarea>
					<label for="important-content">2) 중요 정보</label>
					<textarea class="form-control" type="text" name="importantContent"
						placeholder="강조하고 싶은 내용을 적어주세요. (100자 이내)" maxlength="100"></textarea>
					<label for="business-time">3) 이용 시간</label>
					<textarea class="form-control" type="text" name="businessTime"
						placeholder="영업시간 안내 (100자 이내)" maxlength="100"></textarea>
					<label for="chooseFile">4) 입구 사진</label>
					<label class="ticketBtn" for="chooseFile" style="font-weight: 200;">파일 선택</label>
					<br>
					<span>( 만나는 장소를 알 수 있는 위치 사진을 올려주세요. )</span> 
					<p class="chk" id="placeChk"> </p>
					<p> </p>
					<div class="upload-box">
						<div id="drop-file" class="drag-file">
							<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
							<p class="message"></p>
							<img src="" alt="미리보기 이미지" class="preview">
						</div>
					</div>
					<input class="file" id="chooseFile" name="file1" type="file" onchange="dropFile.handleFiles(this.files)"
						accept="image/png, image/jpeg, image/gif">
					<label>5) 상품사진</label>
					<label class="ticketBtn" for="btnAtt" style="font-weight: 200;">파일 선택</label>
					<br>
					<span>( 첫번째 사진이 대표 사진이 됩니다. )</span><span style="color:red;"> - 4장 필수</span>
					<br>
					<p class="chk" id="productChk"> </p>
	
					<div id='image_preview'>
						<input class="file" type='file' id='btnAtt' name="file2" multiple='multiple' accept="image/png, image/jpeg, image/gif" onchange="addFile(this);"/>
						<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
					</div>
					<label for="ticket-content">6) 상품 설명</label>
					<div class="container">
						<textarea class="summernote" id="ticket-content" name="ticketContent"></textarea>    
					</div>
				</div>
	
				<h4 class="h4">4. 옵션 입력</h4>
				<div class="content-box">
					<div class="content-box" id="opt" style="border: none; padding: 0;">
						<div class="optBox">
							<label for="optTitle">옵션 제목</label>
							<input class="form-control" type="text" id="optTitle" name="optTitles" placeholder="제목을 입력해 주세요. (30자 이내)" maxlength="30">
							<label for="optContent">옵션 설명</label>
							<input class="form-control" type="text" id="optContent" name="optContents" placeholder="내용을 입력해 주세요. (100자 이내)" maxlength="100">
							<label for="optPrice">가격</label>
							<input class="form-control price" type="number" id="optPrice" name="optPrices" min="100">
							<label for="optDiscountRate">할인율</label><span>(%)</span>
							<input class="form-control rate" type="number" id="optDiscountRate" name="optDiscountRates" min="0" max="100" value="0">
							<label for="optDiscountPrice">할인된 가격</label>
							<input class="form-control" type="number" id="optDiscountPrice" name="optDiscountPrices" min="100">
							<label for="optStock">재고</label>
							<input class="form-control" type="number" id="optStock" name="optStocks" value="10" min="0">
							<input type="hidden" id="count" name="count" value="1">
						</div>
					</div>
					<div class="addBtnBox">
						<button type="button" class="btn btn-secondary" id="optAdd" onclick="add_optbox()">추가</button>
					</div>
				</div>
	
				<h4 class="h4">5. 소요시간 입력</h4>
				<div class="content-box">
					<div style="display: flex;">
						<select id="hour" class="form-select" style="width: 20%;">
							<c:forEach var="i" begin="1" end="24">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
						<span style="margin-left:5px ;margin-right:30px ; line-height: 35px;">시간</span>
						<select id="minute" class="form-select" style="width: 20%;">
							<option value="0">00</option>
							<option value="30">30</option>
						</select>
						<span style="margin-left:5px ;margin-right:20px ; line-height: 35px;">분 소요</span>
					</div>	
					<input type="hidden" name="requiredTime">
				</div>
	
				<button type="button" class="btn btn-info" id="insertBtn">제출</button>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="/resources/js/ticket/insertTicketForm.js"></script>
</body>

</html>